import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/core/theme/app_color.dart';
import 'package:store/core/theme/app_style.dart';
import 'package:store/core/util/size_manager.dart';
import 'package:store/presentation/common/ratingbar_widget.dart';

import '../../../core/util/app_navigator.dart';
import '../../../core/util/app_routes.dart';
import '../../../domain/entity/deal.dart';
import '../../common/spacer_widget.dart';

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
        right: AppSize.marginWidthExtraSmall,
        left: AppSize.marginWidthExtraSmall,
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
      onTap: () => _dealCardClick(context, deals[i].productId),
      child: SizedBox(
        width: AppSize.width4,
        child: Card(
          margin: AppSize.marginSTEB(end: AppSize.marginWidthExtraSmall),
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
                  imageUrl: deals[i].image,
                  fit: BoxFit.contain,
                ),
                SpacerWidget(
                  height: AppSize.height0_01,
                ),
                Text(
                  deals[i].price.toString(),
                  style: const TextStyle(
                    color: AppColor.greyLight,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SpacerWidget(
                  height: AppSize.height0_01,
                ),
                Text(
                  deals[i].discountedPrice.toString(),
                  style: AppStyle.textBold(
                    color: AppColor.orange,
                    size: AppSize.fontLarge,
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
    AppNavigator.push(context, Routes.routeDeal, data: dealId);
  }
}
