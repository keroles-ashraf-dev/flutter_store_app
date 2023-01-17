import '../../model/carousel_model.dart';
import '../../network/api_constant.dart';
import '../../network/api_manager.dart';

abstract class BaseCarouselRemoteDatasource {
  Future<List<CarouselItemModel>> getMainCarousel();
}

class CarouselRemoteDatasourceImpl implements BaseCarouselRemoteDatasource {
  final ApiManager _apiManager;

  CarouselRemoteDatasourceImpl(this._apiManager);

  @override
  Future<List<CarouselItemModel>> getMainCarousel() async {
    try {
      final res = await _apiManager().get(
        ApiConstant.mainCarouselUri,
        sendAuth: false,
      );

      final jsonData = res.data[ApiConstant.resDataKey];
      final carouselData = jsonData[ApiConstant.resDataCarouselKey];
      final carousel = carouselData as List;
      final carouselList = carousel.map((e) => CarouselItemModel.fromJson(e));

      return List<CarouselItemModel>.from(carouselList);
    } catch (e) {
      rethrow;
    }
  }
}
