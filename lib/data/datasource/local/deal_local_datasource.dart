import 'dart:convert';

import 'package:store/core/cache/cache_constant.dart';
import 'package:store/core/cache/cache_manager.dart';
import 'package:store/core/debug/function.dart';
import 'package:store/core/error/error_handling.dart';
import 'package:store/core/error/exception.dart';
import 'package:store/core/util/function.dart';
import 'package:store/data/model/deal_model.dart';

abstract class BaseDealLocalDatasource {
  Future<List<DealModel>> getDeals();

  Future<void> cacheDeals(List<DealModel> deals);
}

class DealLocalDatasourceImpl implements BaseDealLocalDatasource {
  final ErrorHandler _errorHandler;
  final CacheManager _cacheManager;

  DealLocalDatasourceImpl(this._errorHandler, this._cacheManager);

  @override
  Future<List<DealModel>> getDeals() async {
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

      final jsonData = json.decode(data);
      final dealsList = jsonData as List;
      final deals = dealsList.map((e) => DealModel.fromJson(e));

      return List<DealModel>.from(deals);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> cacheDeals(List<DealModel> deals) async {
    final dealsMap = deals.map((e) => e.toJson()).toList();
    final String dealsJson = json.encode(dealsMap);

    await _cacheManager().write(CacheConstant.dealsDataKey, dealsJson);
    await _cacheManager()
        .write(CacheConstant.dealsCreatedKey, currentTimestamp());
  }
}
