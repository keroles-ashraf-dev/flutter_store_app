import 'package:equatable/equatable.dart';

import '../../core/util/app_constant.dart';

class CarouselItem extends Equatable {
  final int id;
  final String image;

  const CarouselItem({required this.id, required this.image});

  /// return empty object
  const CarouselItem.empty({
    this.id = AppConstant.emptyInt,
    this.image = AppConstant.emptyStr,
  });

  @override
  List<Object> get props => [id, image];
}
