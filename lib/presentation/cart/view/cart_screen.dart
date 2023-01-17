import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/session/session.dart';
import 'package:store/domain/entity/get_cart_request.dart';
import 'package:store/presentation/cart/component/cart_screen_checkout_widget.dart';
import 'package:store/presentation/cart/component/cart_screen_items_widget.dart';
import 'package:store/presentation/cart/controller/cart_screen_bloc.dart';

import '../../../core/service_locator/app_module.dart';
import '../../../core/util/size_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartScreenBloc>(
      create: (context) {
        return sl<CartScreenBloc>()
          ..add(CartScreenGetCartEvent(
            GetCartRequest(userId: sl<Session>().userId),
          ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppSize.marginWidthExtraSmall,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CartScreenCheckoutWidget(),
              CartScreenItemsWidget(),
            ],
          ),
        ),
      ),
    );
  }


}
