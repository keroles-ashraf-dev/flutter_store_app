import 'package:flutter/material.dart';

import '../../../app/util/asset_manager.dart';
import '../../resource/size_manager.dart';

class HomeScreenCarouselLoadingWidget extends StatelessWidget {
  const HomeScreenCarouselLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.width,
      height: AppSize.height3_5,
      child: Image.asset(
        Images.imagePlaceholder,
        width: AppSize.width,
        height: AppSize.height3_5,
        fit: BoxFit.cover,
      ),
    );
  }
}
