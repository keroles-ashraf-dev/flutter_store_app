import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigator.dart';
import '../../../core/navigation/routes.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_style.dart';
import '../../../core/util/app_constant.dart';
import '../../../domain/entity/deal.dart';
import '../../resource/component/ratingbar_widget.dart';
import '../../resource/component/spacer_widget.dart';
import '../../resource/size_manager.dart';
import '../../resource/ui_helper.dart';

class HomeScreenDealsWidget extends StatelessWidget {
  final List<Deal> deals;

  const HomeScreenDealsWidget({Key? key, required this.deals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width,
      height: AppSize.height3_5,
      margin: EdgeInsets.only(
        bottom: AppSize.marginHeightDoubleExtraSmall,
        left: AppSize.marginWidthExtraSmall,
        right: AppSize.marginWidthExtraSmall,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: deals.length,
        itemBuilder: (context, i) => _dealsCard(context, i),
      ),
    );
  }

  Widget _dealsCard(BuildContext context, int i) {
    return InkWell(
      onTap: () => _dealCardClick(context, deals[i].id),
      child: SizedBox(
        width: AppSize.width4,
        child: Card(
          margin: UIHelper.marginSTEB(end: AppSize.marginWidthExtraSmall),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.paddingWidthDoubleExtraSmall,
              vertical: AppSize.paddingHeightDoubleExtraSmall,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.height0_05,
                  child: Text(
                    deals[i].name,
                    textAlign: TextAlign.center,
                  ),
                ),
                SpacerWidget(
                  height: AppSize.height0_01,
                ),
                CachedNetworkImage(
                  width: AppSize.width2,
                  height: AppSize.width2,
                  imageUrl: deals[i].images.first,
                  fit: BoxFit.contain,
                ),
                SpacerWidget(
                  height: AppSize.height0_01,
                ),
                Text(
                  deals[i].price.toString() + AppConstant.dollarSign,
                  style: AppStyle.textRegular(
                    color: AppColor.disabled,
                  ).copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SpacerWidget(height: AppSize.height0_01),
                Text(
                  deals[i].discountedPrice.toString() + AppConstant.dollarSign,
                  style: AppStyle.textBold(
                    color: AppColor.primary,
                    size: AppSize.fontExtraLarge,
                  ),
                ),
                SpacerWidget(
                  height: AppSize.height0_01,
                ),
                RatingbarWidget(
                  rating: deals[i].rating,
                  ratersCount: deals[i].ratersCount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _dealCardClick(BuildContext context, int dealId) {
    AppNavigator.push(context, Routes.routeDeal, data: {'id': dealId});
  }
}
