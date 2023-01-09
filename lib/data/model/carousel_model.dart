import '../../domain/entity/carousel_item.dart';

class CarouselItemModel extends CarouselItem {
  const CarouselItemModel({required super.id, required super.image});

  factory CarouselItemModel.fromJson(Map<String, dynamic> json) {
    return CarouselItemModel(
      id: json['id'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
    };
  }
}
