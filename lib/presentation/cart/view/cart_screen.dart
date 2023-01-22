import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/domain/entity/get_cart_request.dart';
import 'package:store/presentation/cart/component/cart_screen_content_widget.dart';
import 'package:store/presentation/cart/component/cart_screen_loading_widget.dart';
import 'package:store/presentation/cart/controller/cart_screen_bloc.dart';

import '../../../core/service_locator/service_locator.dart';
import '../../../core/session/session.dart';
import '../../../core/util/enum.dart';
import '../../resource/component/center_error_widget.dart';

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
      child: BlocBuilder<CartScreenBloc, CartScreenState>(
        buildWhen: (prev, current) {
          return prev.cartRequestState != current.cartRequestState;
        },
        builder: (context, state) {
          switch (state.cartRequestState) {
            case RequestStateEnum.initializing:
              return const CartScreenLoadingWidget();
            case RequestStateEnum.loading:
              return const CartScreenLoadingWidget();
            case RequestStateEnum.success:
              return CartScreenContentWidget(cart: state.cart);
            case RequestStateEnum.failure:
              return CenterErrorWidget(error: state.error);
          }
        },
      ),
    );
  }
}
