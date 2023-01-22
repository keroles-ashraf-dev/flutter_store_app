import 'package:equatable/equatable.dart';
import 'package:store/domain/entity/cart_item.dart';

import '../../core/util/app_constant.dart';

class Cart extends Equatable {
  final List<CartItem> items;
  final double subtotal;
  final double shipping;
  final double vat;
  final double total;

  const Cart({
    required this.items,
    required this.subtotal,
    required this.shipping,
    required this.vat,
    required this.total,
  });

  /// return empty object
  const Cart.empty({
    this.items = const [CartItem.empty()],
    this.subtotal = AppConstant.emptyDol,
    this.shipping = AppConstant.emptyDol,
    this.vat = AppConstant.emptyDol,
    this.total = AppConstant.emptyDol,
  });

  @override
  List<Object> get props => [
        items,
        subtotal,
        shipping,
        vat,
        total,
      ];
}
