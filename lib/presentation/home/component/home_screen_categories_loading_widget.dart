import 'package:flutter/material.dart';

import '../../../core/util/size_manager.dart';
import '../../../core/util/ui_constant.dart';
import '../../common/shimmer_widget.dart';

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
          itemCount: UIConstant.loadingItemsCount,
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