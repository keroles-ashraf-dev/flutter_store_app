import 'dart:convert';

import 'package:store/data/model/deal_model.dart';

import '../../../app/error/error_handling.dart';
import '../../../app/error/exception.dart';
import '../../../app/util/function.dart';
import '../../cache/cache_constant.dart';
import '../../cache/cache_manager.dart';

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
