import 'package:store/data/model/cart_model.dart';
import 'package:store/domain/entity/cart.dart';
import 'package:store/domain/entity/get_cart_request.dart';

import '../model/get_cart_request_model.dart';

extension CartModelMapper on CartModel {
  Cart get toEntity {
    return Cart(
      items: items,
      subtotal: subtotal,
      shipping: shipping,
      vat: vat,
      total: total,
    );
  }
}

extension CartMapper on Cart {
  CartModel get toModel {
    return CartModel(
      items: items,
      subtotal: subtotal,
      shipping: shipping,
      vat: vat,
      total: total,
    );
  }
}

extension GetCartRequestMapper on GetCartRequest {
  GetCartRequestModel get toModel {
    return GetCartRequestModel(
      userId: userId,
    );
  }
}
