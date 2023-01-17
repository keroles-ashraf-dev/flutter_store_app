import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/domain/entity/get_cart_request.dart';
import 'package:store/presentation/cart/component/cart_screen_checkout_widget.dart';
import 'package:store/presentation/cart/component/cart_screen_items_widget.dart';
import 'package:store/presentation/cart/controller/cart_screen_bloc.dart';

import '../../../app/service_locator/service_locator.dart';
import '../../../app/session/session.dart';
import '../../resource/size_manager.dart';



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
      lazy: false,
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
