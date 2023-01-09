import 'dart:convert';

import 'package:store/core/cache/cache_constant.dart';
import 'package:store/core/cache/cache_manager.dart';
import 'package:store/core/error/error_handling.dart';
import 'package:store/core/error/exception.dart';
import 'package:store/core/util/function.dart';
import 'package:store/data/model/carousel_model.dart';

abstract class BaseCarouselLocalDatasource {
  Future<List<CarouselItemModel>> getMainCarousel();

  Future<void> cacheMainCarousel(List<CarouselItemModel> carouselItems);
}

class CarouselLocalDatasourceImpl implements BaseCarouselLocalDatasource {
  final ErrorHandler _errorHandler;
  final CacheManager _cacheManager;

  CarouselLocalDatasourceImpl(this._errorHandler, this._cacheManager);

  @override
  Future<List<CarouselItemModel>> getMainCarousel() async {
    try {
      if (!await _cacheManager.isValid(
        CacheConstant.mainCarouselCreatedKey,
        CacheConstant.mainCarouselDataKey,
      )) {
        throw CacheException(_errorHandler.cacheError());
      }
      final data = await _cacheManager().read(CacheConstant.mainCarouselDataKey);

      if (data == null) {
        throw CacheException(_errorHandler.cacheError());
      }

      final jsonData = json.decode(data);
      final carouselList = jsonData as List;
      final carousel = carouselList.map((e) => CarouselItemModel.fromJson(e));

      return List<CarouselItemModel>.from(carousel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> cacheMainCarousel(List<CarouselItemModel> carouselItems) async {
    final carouselModels = carouselItems.map((e) => e.toJson()).toList();
    final String carouselJson = json.encode(carouselModels);

    await _cacheManager()
        .write(CacheConstant.mainCarouselDataKey, carouselJson);
    await _cacheManager()
        .write(CacheConstant.mainCarouselCreatedKey, currentTimestamp());
  }
}
