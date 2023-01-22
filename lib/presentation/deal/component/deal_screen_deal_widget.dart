import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/presentation/resource/component/carousel_widget.dart';
import 'package:store/presentation/resource/component/elevated_btn_widget.dart';
import 'package:store/presentation/resource/component/ratingbar_widget.dart';

import '../../../core/i18n/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_style.dart';
import '../../../core/util/app_constant.dart';
import '../../../domain/entity/deal.dart';
import '../../resource/component/spacer_widget.dart';
import '../../resource/size_manager.dart';

class DealScreenDealWidget extends StatelessWidget {
  final Deal deal;

  const DealScreenDealWidget({Key? key, required this.deal}) : super(key: key);

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
                  deal.name,
                  style: AppStyle.textRegular(size: AppSize.fontLarge),
                ),
                SpacerWidget(height: AppSize.height0_01),
                RatingbarWidget(
                    rating: deal.rating, ratersCount: deal.ratersCount),
              ],
            ),
          ),
          SpacerWidget(height: AppSize.height0_01),
          CarouserWidget(
            images: deal.images,
            height: AppSize.height3,
            width: AppSize.width,
          ),
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
                  deal.price.toString() + AppConstant.dollarSign,
                  style: AppStyle.textRegular(
                    color: AppColor.disabled,
                    size: AppSize.fontLarge,
                  ).copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SpacerWidget(height: AppSize.height0_01),
                Text(
                  deal.discountedPrice.toString() + AppConstant.dollarSign,
                  style: AppStyle.textBold(
                    color: AppColor.primary,
                    size: AppSize.fontExtraLarge,
                  ),
                ),
                SpacerWidget(height: AppSize.height0_02),
                Text(
                  deal.availableCount.toString() +
                      AppConstant.space +
                      AppString.inStock.i18n(),
                  style: AppStyle.textBold(
                    color: AppColor.green,
                    size: AppSize.fontExtraLarge,
                  ),
                ),
                SpacerWidget(height: AppSize.height0_02),
                Text(deal.description),
                SpacerWidget(height: AppSize.height0_05),
                ElevatedBtnWidget(
                  width: AppSize.width,
                  text: AppString.addToCart.i18n(),
                  action: () => _addToCart(context, deal.productId),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _addToCart(BuildContext context, int productId) {}
}
