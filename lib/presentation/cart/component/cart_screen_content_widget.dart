import 'package:flutter/material.dart';

import '../../../domain/entity/cart.dart';
import '../../resource/component/spacer_widget.dart';
import '../../resource/size_manager.dart';
import 'cart_screen_checkout_widget.dart';
import 'cart_screen_items_widget.dart';

class CartScreenContentWidget extends StatelessWidget {
  final Cart cart;

  const CartScreenContentWidget({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSize.marginHeightDoubleExtraSmall,
        horizontal: AppSize.marginWidthExtraSmall,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CartScreenCheckoutWidget(cart: cart),
            SpacerWidget(height: AppSize.height0_03),
            CartScreenItemsWidget(cart: cart),
          ],
        ),
      ),
    );
  }
}
