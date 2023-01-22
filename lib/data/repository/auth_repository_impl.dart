import 'package:dartz/dartz.dart';
import 'package:store/data/mapper/auth_mapper.dart';
import 'package:store/data/mapper/user_mapper.dart';
import 'package:store/domain/entity/login_request.dart';
import 'package:store/domain/entity/register_request.dart';

import '../../core/error/error_handling.dart';
import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/base_auth_repository.dart';
import '../datasource/remote/auth_remote_datasource.dart';
import '../network/network_info.dart';

class AuthRepositoryImpl implements BaseAuthRepository {
  final ErrorHandler _errorHandler;
  final NetworkInfo _networkInfo;
  final BaseAuthRemoteDatasource _authRemoteDatasource;

  AuthRepositoryImpl(
      this._errorHandler, this._networkInfo, this._authRemoteDatasource);

  /// login
  @override
  Future<Either<Failure, User>> login(LoginRequest loginRequest) async {
    try {
      /// check network first
      if (!(await _networkInfo.isConnected)) {
        return Left(_errorHandler.localError());
      }

      /// send data to server
      final userModel = await _authRemoteDatasource.login(loginRequest.toModel);

      return Right(userModel.toEntity);
    } on ServerException catch (e) {
      return Left(e.serverFailure);
    }
  }

  /// register
  @override
  Future<Either<Failure, User>> register(
      RegisterRequest registerRequest) async {
    try {
      /// check network first
      if (!(await _networkInfo.isConnected)) {
        return Left(_errorHandler.localError());
      }

      /// send data to server
      final userModel =
          await _authRemoteDatasource.register(registerRequest.toModel);

      return Right(userModel.toEntity);
    } on ServerException catch (e) {
      return Left(e.serverFailure);
    }
  }
}
