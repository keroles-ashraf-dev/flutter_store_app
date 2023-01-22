import 'package:dartz/dartz.dart';
import 'package:store/data/datasource/local/carousel_local_datasource.dart';
import 'package:store/data/datasource/remote/carousel_remote_datasource.dart';
import 'package:store/data/mapper/carousel_mapper.dart';
import 'package:store/domain/entity/carousel_item.dart';
import 'package:store/domain/repository/base_carousel_repository.dart';

import '../../core/error/error_handling.dart';
import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../network/network_info.dart';

class CarouselRepositoryImpl implements BaseCarouselRepository {
  final ErrorHandler _errorHandler;
  final NetworkInfo _networkInfo;
  final BaseCarouselLocalDatasource _carouselLocalDatasource;
  final BaseCarouselRemoteDatasource _carouselRemoteDatasource;

  CarouselRepositoryImpl(
    this._errorHandler,
    this._networkInfo,
    this._carouselLocalDatasource,
    this._carouselRemoteDatasource,
  );

  @override
  Future<Either<Failure, List<CarouselItem>>> getMainCarousel() async {
    try {
      /// load data from cache
      final carsModels = await _carouselLocalDatasource.getMainCarousel();
      final carousel = carsModels.map((e) => e.toEntity).toList();

      return Right(carousel);
    } on CacheException catch (_) {
      /// cache thrown exception so load data from server
      try {
        /// check network first
        if (!(await _networkInfo.isConnected)) {
          return Left(_errorHandler.localError());
        }

        /// load data from server
        final carsModels = await _carouselRemoteDatasource.getMainCarousel();

        /// cache data
        await _carouselLocalDatasource.cacheMainCarousel(carsModels);

        final carousel = carsModels.map((e) => e.toEntity).toList();
        return Right(carousel);
      } on ServerException catch (e) {
        /// server thrown exception so return failure
        return Left(e.serverFailure);
      }
    }
  }
}
