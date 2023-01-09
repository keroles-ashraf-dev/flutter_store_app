import 'package:dartz/dartz.dart';
import 'package:store/data/datasource/remote/product_remote_datasource.dart';
import 'package:store/data/mapper/product_mapper.dart';
import 'package:store/domain/entity/product.dart';
import 'package:store/domain/repository/base_product_repository.dart';

import '../../core/error/error_handling.dart';
import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../core/network/network_info.dart';
import '../datasource/local/product_local_datasource.dart';

class ProductRepositoryImpl implements BaseProductRepository {
  final ErrorHandler _errorHandler;
  final NetworkInfo _networkInfo;
  final BaseProductLocalDatasource _productLocalDatasource;
  final BaseProductRemoteDatasource _productRemoteDatasource;

  ProductRepositoryImpl(
    this._errorHandler,
    this._networkInfo,
    this._productLocalDatasource,
    this._productRemoteDatasource,
  );

  @override
  Future<Either<Failure, List<Product>>> getDeals() async {
    try {
      /// load data from cache
      final dealsModels = await _productLocalDatasource.getDeals();
      final deals = dealsModels.map((e) => e.toEntity).toList();

      return Right(deals);
    } on CacheException catch (_) {
      /// cache thrown exception so load data from server
      try {
        /// check network first
        if (!(await _networkInfo.isConnected)) {
          return Left(_errorHandler.localError());
        }

        /// load data from server
        final dealsModels = await _productRemoteDatasource.getDeals();

        /// cache data
        await _productLocalDatasource.cacheDeals(dealsModels);

        final deals = dealsModels.map((e) => e.toEntity).toList();
        return Right(deals);
      } on ServerException catch (e) {
        /// server thrown exception so return failure
        return Left(e.serverFailure);
      }
    }
  }
}
