import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../core/i18n/app_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_style.dart';
import '../../../core/util/app_constant.dart';
import '../../../core/util/asset_manager.dart';
import '../../resource/component/elevated_btn_widget.dart';
import '../../resource/component/ratingbar_widget.dart';
import '../../resource/component/shimmer_widget.dart';
import '../../resource/component/spacer_widget.dart';
import '../../resource/size_manager.dart';

class ProductScreenLoadingWidget extends StatelessWidget {
  const ProductScreenLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: Column(
        children: [
          Container(
            width: AppSize.width,
            margin: EdgeInsets.symmetric(
              horizontal: AppSize.marginWidthExtraSmall,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacerWidget(height: AppSize.height0_01),
                const RatingbarWidget(
                    rating: AppConstant.emptyDol,
                    ratersCount: AppConstant.emptyInt),
              ],
            ),
          ),
          SpacerWidget(height: AppSize.height0_01),
          Image.asset(
            Images.imagePlaceholder,
            width: AppSize.width,
            height: AppSize.height3,
            fit: BoxFit.cover,
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
                  AppConstant.dollarSign,
                  style: AppStyle.textRegular(
                    color: AppColor.disabled,
                    size: AppSize.fontLarge,
                  ).copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SpacerWidget(height: AppSize.height0_01),
                Text(
                  AppConstant.dollarSign,
                  style: AppStyle.textBold(
                    color: AppColor.primary,
                    size: AppSize.fontExtraLarge,
                  ),
                ),
                SpacerWidget(height: AppSize.height0_02),
                Text(
                  AppConstant.space + AppString.inStock.i18n(),
                  style: AppStyle.textBold(
                    color: AppColor.green,
                    size: AppSize.fontExtraLarge,
                  ),
                ),
                SpacerWidget(height: AppSize.height0_02),
                SizedBox(
                  height: AppSize.height2,
                  width: AppSize.width,
                ),
                SpacerWidget(height: AppSize.height0_02),
                ElevatedBtnWidget(
                  width: AppSize.width,
                  text: AppString.addToCart.i18n(),
                  action: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
