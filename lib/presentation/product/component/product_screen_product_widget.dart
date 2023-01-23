import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/core/session/session.dart';
import 'package:store/presentation/product/controller/product_screen_bloc.dart';
import 'package:store/presentation/resource/component/carousel_widget.dart';
import 'package:store/presentation/resource/component/elevated_btn_widget.dart';
import 'package:store/presentation/resource/component/ratingbar_widget.dart';

import '../../../core/i18n/app_string.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_style.dart';
import '../../../core/util/app_constant.dart';
import '../../../domain/entity/add_to_cart_request.dart';
import '../../../domain/entity/product.dart';
import '../../resource/component/spacer_widget.dart';
import '../../resource/size_manager.dart';

class ProductScreenProductWidget extends StatelessWidget {
  final Product product;

  const ProductScreenProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SpacerWidget(height: AppSize.height0_02),
          Container(
            width: AppSize.width,
            margin: EdgeInsets.symmetric(
              horizontal: AppSize.marginWidthExtraSmall,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppStyle.textRegular(size: AppSize.fontLarge),
                ),
                SpacerWidget(height: AppSize.height0_01),
                RatingbarWidget(
                    rating: product.rating, ratersCount: product.ratersCount),
              ],
            ),
          ),
          SpacerWidget(height: AppSize.height0_01),
          CarouserWidget(
            images: product.images,
            height: AppSize.height3,
            width: AppSize.width,
          ),
          SpacerWidget(height: AppSize.height0_03),
          Container(
            width: AppSize.width,
            margin: EdgeInsets.symmetric(
              horizontal: AppSize.marginWidthExtraSmall,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: product.discountedPrice > 0,
                  replacement: Text(
                    product.price.toString() + AppConstant.dollarSign,
                    style: AppStyle.textBold(
                      color: AppColor.primary,
                      size: AppSize.fontExtraLarge,
                    ),
                  ),
                  child: Text(
                    product.price.toString() + AppConstant.dollarSign,
                    style: AppStyle.textRegular(
                      color: AppColor.disabled,
                      size: AppSize.fontLarge,
                    ).copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
                Visibility(
                  visible: product.discountedPrice > 0,
                  child: Column(
                    children: [
                      SpacerWidget(height: AppSize.height0_01),
                      Text(
                        product.discountedPrice.toString() + AppConstant.dollarSign,
                        style: AppStyle.textBold(
                          color: AppColor.primary,
                          size: AppSize.fontExtraLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                SpacerWidget(height: AppSize.height0_02),
                Text(
                  product.availableCount.toString() +
                      AppConstant.space +
                      AppString.inStock.i18n(),
                  style: AppStyle.textBold(
                    color: AppColor.green,
                    size: AppSize.fontExtraLarge,
                  ),
                ),
                SpacerWidget(height: AppSize.height0_02),
                Text(product.description),
                SpacerWidget(height: AppSize.height0_05),
                ElevatedBtnWidget(
                  width: AppSize.width,
                  text: AppString.addToCart.i18n(),
                  action: () => _addToCart(context, product.id),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _addToCart(BuildContext context, int productId) {
    final request = AddToCartRequest(userId: sl<Session>().userId, productId: productId);
    BlocProvider.of<ProductScreenBloc>(context).add(ProductScreenAddToCartEvent(request));
  }
}
