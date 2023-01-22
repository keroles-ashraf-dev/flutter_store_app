import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/domain/entity/cart_item.dart';

import '../../../core/navigation/app_navigator.dart';
import '../../../core/navigation/routes.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_style.dart';
import '../../../core/util/app_constant.dart';
import '../../../domain/entity/cart.dart';
import '../../resource/component/item_quantity_widget.dart';
import '../../resource/component/spacer_widget.dart';
import '../../resource/size_manager.dart';

class CartScreenItemsWidget extends StatelessWidget {
  final Cart cart;

  const CartScreenItemsWidget({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cart.items.length,
        itemBuilder: (context, i) {
          return _itemCard(context, cart.items[i]);
        },
      ),
    );
  }

  Widget _itemCard(BuildContext context, CartItem i) {
    return InkWell(
      onTap: () => _itemClick(context, i.productId),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.paddingWidthDoubleExtraSmall,
            vertical: AppSize.paddingHeightDoubleExtraSmall,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: AppSize.width2,
                height: AppSize.width2,
                imageUrl: i.images.first,
                fit: BoxFit.contain,
              ),
              SpacerWidget(
                width: AppSize.width0_03,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    i.name,
                    textAlign: TextAlign.center,
                  ),
                  SpacerWidget(
                    height: AppSize.height0_01,
                  ),
                  Visibility(
                    visible: i.discountedPrice > AppConstant.zeroDol,
                    child: Column(
                      children: [
                        Text(
                          i.price.toString() + AppConstant.dollarSign,
                          style: AppStyle.textRegular(
                            color: AppColor.disabled,
                            size: AppSize.fontLarge,
                          ).copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SpacerWidget(height: AppSize.height0_01),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: i.discountedPrice > AppConstant.zeroDol,
                    replacement: Text(
                      i.price.toString() + AppConstant.dollarSign,
                      style: AppStyle.textBold(
                        color: AppColor.primary,
                        size: AppSize.fontExtraLarge,
                      ),
                    ),
                    child: Text(
                      i.discountedPrice.toString() + AppConstant.dollarSign,
                      style: AppStyle.textBold(
                        color: AppColor.primary,
                        size: AppSize.fontExtraLarge,
                      ),
                    ),
                  ),
                  SpacerWidget(height: AppSize.height0_01),
                  Text(
                    i.availableCount.toString() +
                        AppConstant.space +
                        AppString.inStock.i18n(),
                    textAlign: TextAlign.center,
                  ),
                  SpacerWidget(height: AppSize.height0_01),
                  ItemQuantityWidget(productId: i.productId, quantity: i.count),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _itemClick(BuildContext context, int productId) {
    AppNavigator.push(context, Routes.routeProduct, data: {'id', productId});
  }
}
