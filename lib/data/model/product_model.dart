import 'package:store/domain/entity/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.image,
    required super.price,
    required super.discountedPrice,
    required super.rating,
    required super.ratersCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      discountedPrice: json['discounted_price'],
      rating: json['rating'],
      ratersCount: json['raters_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "price": price,
      "discounted-price": discountedPrice,
      "rating": rating,
      "raters-count": ratersCount,
    };
  }
}
