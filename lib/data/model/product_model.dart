import 'package:store/core/util/extension.dart';
import 'package:store/domain/entity/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.images,
    required super.price,
    required super.discountedPrice,
    required super.availableCount,
    required super.rating,
    required super.ratersCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'].toString().orEmpty(),
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
      "name": name,
      "description": description,
      "images": images,
      "price": price,
      "discounted-price": discountedPrice,
      "available-count": availableCount,
      "rating": rating,
      "raters-count": ratersCount,
    };
  }
}
