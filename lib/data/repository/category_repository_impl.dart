import 'package:dartz/dartz.dart';
import 'package:store/data/datasource/local/category_local_datasource.dart';
import 'package:store/data/datasource/remote/category_remote_datasource.dart';
import 'package:store/data/mapper/category_mapper.dart';
import 'package:store/domain/repository/base_category_repository.dart';

import '../../app/error/error_handling.dart';
import '../../app/error/exception.dart';
import '../../app/error/failure.dart';
import '../../domain/entity/category.dart';
import '../network/network_info.dart';

class CategoryRepositoryImpl implements BaseCategoryRepository {
  final ErrorHandler _errorHandler;
  final NetworkInfo _networkInfo;
  final BaseCategoryLocalDatasource _categoryLocalDatasource;
  final BaseCategoryRemoteDatasource _categoryRemoteDatasource;

  CategoryRepositoryImpl(
    this._errorHandler,
    this._networkInfo,
    this._categoryLocalDatasource,
    this._categoryRemoteDatasource,
  );

  @override
  Future<Either<Failure, List<Category>>> getMainCategories() async {
    try {
      /// load data from cache
      final catsModels = await _categoryLocalDatasource.getMainCategories();
      final cats = catsModels.map((e) => e.toEntity).toList();

      return Right(cats);
    } on CacheException catch (_) {
      /// cache thrown exception so load data from server
      try {
        /// check network first
        if (!(await _networkInfo.isConnected)) {
          return Left(_errorHandler.localError());
        }

        /// load data from server
        final catsModels = await _categoryRemoteDatasource.getMainCategories();

        /// cache data
        await _categoryLocalDatasource.cacheMainCategories(catsModels);

        final cats = catsModels.map((e) => e.toEntity).toList();
        return Right(cats);
      } on ServerException catch (e) {
        /// server thrown exception so return failure
        return Left(e.serverFailure);
      }
    }
  }
}
