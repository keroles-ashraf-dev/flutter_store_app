import 'package:dartz/dartz.dart';
import 'package:store/data/datasource/remote/address_remote_datasource.dart';
import 'package:store/data/mapper/address_mapper.dart';
import 'package:store/domain/entity/address.dart';
import 'package:store/domain/entity/get_address_request.dart';

import '../../core/error/error_handling.dart';
import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/repository/base_address_repository.dart';
import '../datasource/local/address_local_datasource.dart';
import '../network/network_info.dart';

class AddressRepositoryImpl implements BaseAddressRepository {
  final ErrorHandler _errorHandler;
  final NetworkInfo _networkInfo;
  final BaseAddressLocalDatasource _addressLocalDatasource;
  final BaseAddressRemoteDatasource _addressRemoteDatasource;

  AddressRepositoryImpl(
    this._errorHandler,
    this._networkInfo,
    this._addressLocalDatasource,
    this._addressRemoteDatasource,
  );

  @override
  Future<Either<Failure, Address>> getAddress(GetAddressRequest request) async {
    try {
      /// check network first
      if (!(await _networkInfo.isConnected)) {
        return Left(_errorHandler.localError());
      }

      /// load data from server
      final addressModel =
          await _addressRemoteDatasource.getAddress(request.toModel);
      final address = addressModel.toEntity;

      return Right(address);
    } on ServerException catch (e) {
      /// server thrown exception so return failure
      return Left(e.serverFailure);
    }
  }
}
