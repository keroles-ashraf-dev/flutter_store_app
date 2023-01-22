import 'package:dartz/dartz.dart';
import 'package:store/data/datasource/remote/deal_remote_datasource.dart';
import 'package:store/data/mapper/deal_mapper.dart';
import 'package:store/domain/entity/deal.dart';
import 'package:store/domain/entity/get_deal_request.dart';

import '../../core/error/error_handling.dart';
import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/repository/base_deal_repository.dart';
import '../datasource/local/deal_local_datasource.dart';
import '../network/network_info.dart';

class DealRepositoryImpl implements BaseDealRepository {
  final ErrorHandler _errorHandler;
  final NetworkInfo _networkInfo;
  final BaseDealLocalDatasource _dealLocalDatasource;
  final BaseDealRemoteDatasource _dealRemoteDatasource;

  DealRepositoryImpl(
    this._errorHandler,
    this._networkInfo,
    this._dealLocalDatasource,
    this._dealRemoteDatasource,
  );

  @override
  Future<Either<Failure, List<Deal>>> getDeals() async {
    try {
      /// load data from cache
      final dealsModels = await _dealLocalDatasource.getDeals();
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
        final dealsModels = await _dealRemoteDatasource.getDeals();

        /// cache data
        await _dealLocalDatasource.cacheDeals(dealsModels);

        final deals = dealsModels.map((e) => e.toEntity).toList();
        return Right(deals);
      } on ServerException catch (e) {
        /// server thrown exception so return failure
        return Left(e.serverFailure);
      }
    }
  }

  @override
  Future<Either<Failure, Deal>> getDeal(GetDealRequest request) async {
    try {
      /// check network first
      if (!(await _networkInfo.isConnected)) {
        return Left(_errorHandler.localError());
      }

      /// load data from server
      final dealModel = await _dealRemoteDatasource.getDeal(request.toModel);
      final deal = dealModel.toEntity;

      return Right(deal);
    } on ServerException catch (e) {
      /// server thrown exception so return failure
      return Left(e.serverFailure);
    }
  }
}
