import 'package:store/core/util/extension.dart';

import '../../domain/entity/cart_item.dart';

class CartItemModel extends CartItem {
  const CartItemModel({
    required super.productId,
    required super.name,
    required super.price,
    required super.discountedPrice,
    required super.availableCount,
    required super.count,
    required super.images,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['id'],
      name: json['name'],
      price: json['price'],
      discountedPrice: json['discounted_price'].toString().toDoubleOrEmpty(),
      availableCount: json['available_count'],
      count: json['count'],
      images: List.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product-id": productId,
      "name": name,
      "price": price,
      "discounted-price": discountedPrice,
      "available-count": availableCount,
      "count": count,
      "images": images,
    };
  }
}
