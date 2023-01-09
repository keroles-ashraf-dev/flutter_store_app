import 'package:store/data/model/carousel_model.dart';
import 'package:store/domain/entity/carousel_item.dart';

extension CarouselModelMapper on CarouselItemModel {
  CarouselItem get toEntity {
    return CarouselItem(
      id: id,
      image: image,
    );
  }
}

extension CarouselItemMapper on CarouselItem {
  CarouselItemModel get toModel {
    return CarouselItemModel(
      id: id,
      image: image,
    );
  }
}
