import 'package:store/app/util/extension.dart';
import 'package:store/domain/entity/deal.dart';

class DealModel extends Deal {
  const DealModel({
    required super.id,
    required super.productId,
    required super.name,
    required super.description,
    required super.images,
    required super.price,
    required super.discountedPrice,
    required super.availableCount,
    required super.rating,
    required super.ratersCount,
  });

  factory DealModel.fromJson(Map<String, dynamic> json) {
    return DealModel(
      id: json['id'],
      productId: json['product_id'],
      name: json['name'],
      description: json['description'],
      images: List.from(json['images']),
      price: json['price'],
      discountedPrice: json['discounted_price'].toString().toDoubleOrEmpty(),
      availableCount: json['available_count'],
      rating: json['rating'].toString().toDoubleOrEmpty(),
      ratersCount: json['raters_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "product_id": productId,
      "name": name,
      "description": description,
      "images": images,
      "price": price,
      "discounted_price": discountedPrice,
      "available_count": availableCount,
      "rating": rating,
      "raters_count": ratersCount,
    };
  }
}
