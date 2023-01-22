import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../core/i18n/app_string.dart';
import '../../resource/component/spacer_widget.dart';
import '../../resource/size_manager.dart';

class SplashScreenProgressWidget extends StatelessWidget {
  const SplashScreenProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSize.marginWidthLarge),
      child: Column(
        children: [
          Text(AppString.gettingThingsReady.i18n()),
          SpacerWidget(height: AppSize.height0_01),
          const LinearProgressIndicator(),
        ],
      ),
    );
  }
}
