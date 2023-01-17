import 'package:flutter/material.dart';

import '../../common/shimmer_widget.dart';
import '../../resource/size_manager.dart';
import '../../resource/ui_constant.dart';

class CategoryScreenLoadingWidget extends StatelessWidget {
  const CategoryScreenLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: UIConstant.categoryShimmerLoadingItemsCount,
      itemBuilder: (context, i) => _categoryCard(),
    );
  }

  Widget _categoryCard() {
    return ShimmerWidget(
      child: SizedBox(
        width: AppSize.width,
        child: const Card(),
      ),
    );
  }
}
