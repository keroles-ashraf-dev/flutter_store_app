import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/presentation/resource/component/text_btn_widget.dart';

import '../../../core/i18n/app_string.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../core/navigation/routes.dart';
import '../../../core/theme/app_style.dart';
import '../../resource/size_manager.dart';

class LoginScreenRegisterWidget extends StatelessWidget {
  const LoginScreenRegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppString.notMemberYet.i18n(),
          style: AppStyle.textRegular(
            color: Theme.of(context).disabledColor,
          ),
        ),
        TextBtnWidget(
          width: AppSize.width2,
          text: AppString.register.i18n(),
          action: () => AppNavigator.replace(context, Routes.routeRegister),
        ),
      ],
    );
  }
}
