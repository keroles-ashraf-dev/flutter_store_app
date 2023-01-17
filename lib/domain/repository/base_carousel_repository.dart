import 'package:dartz/dartz.dart';
import 'package:store/domain/entity/carousel_item.dart';

import '../../app/error/failure.dart';

abstract class BaseCarouselRepository {
  Future<Either<Failure, List<CarouselItem>>> getMainCarousel();
}
