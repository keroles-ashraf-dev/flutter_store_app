import 'package:dartz/dartz.dart';
import 'package:store/data/datasource/remote/cart_remote_datasource.dart';
import 'package:store/data/mapper/cart_mapper.dart';
import 'package:store/domain/entity/cart.dart';
import 'package:store/domain/entity/get_cart_request.dart';

import '../../core/error/error_handling.dart';
import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/repository/base_cart_repository.dart';
import '../network/network_info.dart';

class CartRepositoryImpl implements BaseCartRepository {
  final ErrorHandler _errorHandler;
  final NetworkInfo _networkInfo;
  final BaseCartRemoteDatasource _cartRemoteDatasource;

  CartRepositoryImpl(
    this._errorHandler,
    this._networkInfo,
    this._cartRemoteDatasource,
  );

  @override
  Future<Either<Failure, Cart>> getCart(GetCartRequest request) async {
    try {
      /// check network first
      if (!(await _networkInfo.isConnected)) {
        return Left(_errorHandler.localError());
      }

      /// load data from server
      final cartModel = await _cartRemoteDatasource.getCart(request.toModel);

      return Right(cartModel.toEntity);
    } on ServerException catch (e) {
      /// server thrown exception so return failure
      return Left(e.serverFailure);
    }
  }
}
