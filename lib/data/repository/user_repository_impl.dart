import 'package:dartz/dartz.dart';
import 'package:store/data/mapper/user_mapper.dart';

import '../../core/error/error_handling.dart';
import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/base_user_repository.dart';
import '../datasource/remote/user_remote_datasource.dart';
import '../network/network_info.dart';

class UserRepositoryImpl implements BaseUserRepository {
  final ErrorHandler _errorHandler;
  final NetworkInfo _networkInfo;
  final BaseUserRemoteDatasource _userRemoteDatasource;

  UserRepositoryImpl(
      this._errorHandler, this._networkInfo, this._userRemoteDatasource);

  @override
  Future<Either<Failure, User>> getUserData() async {
    try {
      /// check network first
      if (!(await _networkInfo.isConnected)) {
        return Left(_errorHandler.localError());
      }

      /// load data from server
      final userModel = await _userRemoteDatasource.getUserData();

      return Right(userModel.toEntity);
    } on ServerException catch (e) {
      return Left(e.serverFailure);
    }
  }
}
