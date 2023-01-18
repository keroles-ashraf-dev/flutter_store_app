import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/app/i18n/app_string.dart';
import 'package:store/app/navigation/app_navigator.dart';
import 'package:store/app/navigation/routes.dart';
import 'package:store/presentation/common/spacer_widget.dart';
import 'package:store/presentation/common/text_btn_widget.dart';

import '../../resource/size_manager.dart';

class LoginRequiredScreen extends StatelessWidget {
  const LoginRequiredScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            vertical: AppSize.marginHeightExtraLarge,
            horizontal: AppSize.marginWidthExtraSmall,
          ),
          child: Column(
            children: [
              Text(AppString.loginRequiredHint.i18n()),
              SpacerWidget(height: AppSize.height0_02),
              TextBtnWidget(
                text: AppString.login.i18n(),
                action: () => AppNavigator.replace(context, Routes.routeLogin),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
