import 'package:store/core/util/extension.dart';
import 'package:store/data/model/cart_item_model.dart';
import 'package:store/domain/entity/cart.dart';

class CartModel extends Cart {
  const CartModel({
    required super.items,
    required super.subtotal,
    required super.shipping,
    required super.vat,
    required super.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: List.from((json['items'] as List).map((e) => CartItemModel.fromJson(e))),
      subtotal: json['subtotal'],
      shipping: json['shipping'].toString().toDoubleOrEmpty(),
      vat: json['vat'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "items": items,
      "subtotal": subtotal,
      "shipping": shipping,
      "vat": vat,
      "total": total,
    };
  }
}
