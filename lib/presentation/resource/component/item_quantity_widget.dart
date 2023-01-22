import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/session/session.dart';
import 'package:store/core/theme/app_color.dart';
import 'package:store/domain/entity/decrease_cart_item_request.dart';
import 'package:store/domain/entity/increase_cart_item_request.dart';
import 'package:store/presentation/cart/controller/cart_screen_bloc.dart';
import 'package:store/presentation/resource/component/icon_btn_widget.dart';
import 'package:store/presentation/resource/size_manager.dart';

import '../../../core/service_locator/service_locator.dart';

class ItemQuantityWidget extends StatelessWidget {
  final int productId;
  final int quantity;

  const ItemQuantityWidget(
      {Key? key, required this.productId, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.disabled, width: AppSize.borderWidthSmall),
        borderRadius: BorderRadius.circular(AppSize.radiusSmall),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconBtnWidget(
            icon: CupertinoIcons.add,
            action: () => _increment(context, productId),
            padding: EdgeInsets.zero,
          ),
          Text(quantity.toString()),
          IconBtnWidget(
            icon: CupertinoIcons.minus,
            action: () => _decrement(context, productId),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  void _increment(BuildContext context, int productId) {
    final request = IncreaseCartItemRequest(
        userId: sl<Session>().userId, productId: productId);

    BlocProvider.of<CartScreenBloc>(context)
        .add(CartScreenIncreaseCartItemEvent(request));
  }

  void _decrement(BuildContext context, int productId) {
    final request = DecreaseCartItemRequest(
        userId: sl<Session>().userId, productId: productId);

    BlocProvider.of<CartScreenBloc>(context)
        .add(CartScreenDecreaseCartItemEvent(request));
  }
}
