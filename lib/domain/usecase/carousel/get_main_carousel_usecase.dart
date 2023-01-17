import 'package:dartz/dartz.dart';

import '../../../app/error/failure.dart';
import '../../entity/carousel_item.dart';
import '../../entity/no_param.dart';
import '../../repository/base_carousel_repository.dart';
import '../base/base_usecase.dart';

class GetMainCarouselUsecase extends BaseUsecase<List<CarouselItem>, NoParams> {
  final BaseCarouselRepository _carouselRepository;

  GetMainCarouselUsecase(this._carouselRepository);

  @override
  Future<Either<Failure, List<CarouselItem>>> call(NoParams params) async {
    return await _carouselRepository.getMainCarousel();
  }
}
