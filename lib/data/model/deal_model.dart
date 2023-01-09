import 'package:store/core/util/extension.dart';
import 'package:store/domain/entity/deal.dart';

class DealModel extends Deal {
  const DealModel({
    required super.id,
    required super.productId,
    required super.name,
    required super.image,
    required super.price,
    required super.discountedPrice,
    required super.rating,
    required super.ratersCount,
  });

  factory DealModel.fromJson(Map<String, dynamic> json) {
    return DealModel(
      id: json['id'],
      productId: json['product_id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      discountedPrice: json['discounted_price'],
      rating: json['rating'].toString().toDouble(),
      ratersCount: json['raters_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "product_id": productId,
      "name": name,
      "image": image,
      "price": price,
      "discounted_price": discountedPrice,
      "rating": rating,
      "raters_count": ratersCount,
    };
  }
}
