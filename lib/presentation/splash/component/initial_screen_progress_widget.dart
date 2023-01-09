import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/core/util/size_manager.dart';

import '../../../core/i18n/app_string.dart';
import '../../common/spacer_widget.dart';

class InitialScreenProgressWidget extends StatelessWidget {
  const InitialScreenProgressWidget({Key? key}) : super(key: key);

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
