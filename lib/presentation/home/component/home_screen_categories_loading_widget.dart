import 'package:flutter/material.dart';

import '../../common/shimmer_widget.dart';
import '../../resource/size_manager.dart';
import '../../resource/ui_constant.dart';

class HomeScreenCategoriesLoadingWidget extends StatelessWidget {
  const HomeScreenCategoriesLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: Container(
        width: AppSize.width,
        margin: EdgeInsets.only(
          right: AppSize.marginWidthExtraSmall,
          left: AppSize.marginWidthExtraSmall,
          top: AppSize.marginHeightLarge,
        ),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (AppSize.width / UIConstant.homeCategoryCardWidth).floor(),
            childAspectRatio: UIConstant.homeCategoryCardAspectRatio,
            crossAxisSpacing: AppSize.width0_02,
            mainAxisSpacing: AppSize.width0_02,
          ),
          itemCount: UIConstant.homeShimmerLoadingItemsCount,
          itemBuilder: (context, i) => _categoryCard(),
        ),
      ),
    );
  }

  Widget _categoryCard() {
    return SizedBox(
      width: AppSize.width4,
      child: const Card(),
    );
  }
}
