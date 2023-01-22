import 'dart:convert';

import 'package:store/data/model/category_model.dart';

import '../../../core/error/error_handling.dart';
import '../../../core/error/exception.dart';
import '../../../core/util/function.dart';
import '../../cache/cache_constant.dart';
import '../../cache/cache_manager.dart';

abstract class BaseCategoryLocalDatasource {
  Future<List<CategoryModel>> getMainCategories();

  Future<void> cacheMainCategories(List<CategoryModel> categories);
}

class CategoryLocalDatasourceImpl implements BaseCategoryLocalDatasource {
  final ErrorHandler _errorHandler;
  final CacheManager _cacheManager;

  CategoryLocalDatasourceImpl(this._errorHandler, this._cacheManager);

  @override
  Future<List<CategoryModel>> getMainCategories() async {
    try {
      if (!await _cacheManager.isValid(
        CacheConstant.mainCategoriesCreatedKey,
        CacheConstant.mainCategoriesDataKey,
      )) {
        throw CacheException(_errorHandler.cacheError());
      }
      final data =
          await _cacheManager().read(CacheConstant.mainCategoriesDataKey);

      if (data == null) {
        throw CacheException(_errorHandler.cacheError());
      }

      final jsonData = json.decode(data);
      final categoriesList = jsonData as List;
      final categories = categoriesList.map((e) => CategoryModel.fromJson(e));

      return List<CategoryModel>.from(categories);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> cacheMainCategories(List<CategoryModel> categories) async {
    final categoriesModels = categories.map((e) => e.toJson()).toList();
    final String categoriesJson = json.encode(categoriesModels);

    await _cacheManager()
        .write(CacheConstant.mainCategoriesDataKey, categoriesJson);
    await _cacheManager()
        .write(CacheConstant.mainCategoriesCreatedKey, currentTimestamp());
  }
}
