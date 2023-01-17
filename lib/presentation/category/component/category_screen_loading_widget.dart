import 'package:flutter/material.dart';

import '../../../core/util/size_manager.dart';
import '../../../core/util/ui_constant.dart';
import '../../common/shimmer_widget.dart';

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
