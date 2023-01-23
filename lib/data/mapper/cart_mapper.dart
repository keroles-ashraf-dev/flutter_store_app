import 'package:store/data/model/add_to_cart_request_model.dart';
import 'package:store/data/model/cart_model.dart';
import 'package:store/domain/entity/add_to_cart_request.dart';
import 'package:store/domain/entity/cart.dart';
import 'package:store/domain/entity/get_cart_request.dart';

import '../../domain/entity/decrease_cart_item_request.dart';
import '../../domain/entity/increase_cart_item_request.dart';
import '../model/decrease_cart_item_request_model.dart';
import '../model/get_cart_request_model.dart';
import '../model/increase_cart_item_request_model.dart';

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

extension AddToCartRequestMapper on AddToCartRequest {
  AddToCartRequestModel get toModel {
    return AddToCartRequestModel(
      userId: userId,
      productId: productId,
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

extension IncreaseCartItemRequestMapper on IncreaseCartItemRequest {
  IncreaseCartItemRequestModel get toModel {
    return IncreaseCartItemRequestModel(
      userId: userId,
      productId: productId,
    );
  }
}

extension DecreaseCartItemRequestMapper on DecreaseCartItemRequest {
  DecreaseCartItemRequestModel get toModel {
    return DecreaseCartItemRequestModel(
      userId: userId,
      productId: productId,
    );
  }
}
