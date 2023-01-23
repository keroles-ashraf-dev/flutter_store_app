import 'package:flutter/material.dart';

import '../../resource/component/shimmer_widget.dart';
import '../../resource/size_manager.dart';
import '../../resource/ui_constant.dart';

class CategoryScreenLoadingWidget extends StatelessWidget {
  const CategoryScreenLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: UIConstant.categoryShimmerLoadingItemsCount,
      itemBuilder: (context, i) => _categoryCard(),
    );
  }

  Widget _categoryCard() {
    return ShimmerWidget(
      child: Container(
        width: AppSize.width,
        height: AppSize.height2,
        margin: EdgeInsets.symmetric(
          vertical: AppSize.marginHeightTripleExtraSmall,
        ),
        child: const Card(),
      ),
    );
  }
}
