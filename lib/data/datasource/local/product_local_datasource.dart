import 'dart:convert';

import 'package:store/core/cache/cache_constant.dart';
import 'package:store/core/cache/cache_manager.dart';
import 'package:store/core/error/error_handling.dart';
import 'package:store/core/error/exception.dart';
import 'package:store/core/util/function.dart';
import 'package:store/data/model/product_model.dart';

abstract class BaseProductLocalDatasource {
  Future<List<ProductModel>> getDeals();

  Future<void> cacheDeals(List<ProductModel> deals);
}

class ProductLocalDatasourceImpl implements BaseProductLocalDatasource {
  final ErrorHandler _errorHandler;
  final CacheManager _cacheManager;

  ProductLocalDatasourceImpl(this._errorHandler, this._cacheManager);

  @override
  Future<List<ProductModel>> getDeals() async {
    try {
      if (!await _cacheManager.isValid(
        CacheConstant.dealsCreatedKey,
        CacheConstant.dealsDataKey,
      )) {
        throw CacheException(_errorHandler.cacheError());
      }
      final data = await _cacheManager().read(CacheConstant.dealsDataKey);

      if (data == null) {
        throw CacheException(_errorHandler.cacheError());
      }

      final dealsList = (json.decode(data)) as List;

      final deals = dealsList.map((e) => ProductModel.fromJson(e));

      return List<ProductModel>.from(deals);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> cacheDeals(List<ProductModel> deals) async {
    final dealsMap = deals.map((e) => e.toJson()).toList();
    final String dealsJson = json.encode(dealsMap);

    await _cacheManager().write(CacheConstant.dealsDataKey, dealsJson);
    await _cacheManager().write(CacheConstant.dealsCreatedKey, currentTimestamp());
  }
}