import 'package:flutter/material.dart';

import '../../../core/util/size_manager.dart';
import '../../common/shimmer_widget.dart';

class HomeScreenDealsLoadingWidget extends StatelessWidget {
  const HomeScreenDealsLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: Container(
        width: AppSize.width,
        height: AppSize.height3_5,
        margin: EdgeInsets.only(
          right: AppSize.marginWidthExtraSmall,
          left: AppSize.marginWidthExtraSmall,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, i) => _dealsCard(),
        ),
      ),
    );
  }

  Widget _dealsCard() {
    return SizedBox(
      width: AppSize.width4,
      child: const Card(),
    );
  }
}
