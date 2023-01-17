import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../app/i18n/app_string.dart';
import '../../../app/navigation/app_navigator.dart';
import '../../../app/navigation/routes.dart';
import '../../../app/theme/app_style.dart';
import '../../resource/size_manager.dart';


class RegisterScreenLoginWidget extends StatelessWidget {
  const RegisterScreenLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppString.alreadyMember.i18n(),
          style: AppStyle.textLight(
            color: Theme.of(context).disabledColor,
            size: AppSize.fontSmall,
          ),
        ),
        TextButton(
          onPressed: () => AppNavigator.replace(context, Routes.routeLogin),
          child: Text(
            AppString.login.i18n(),
            style: AppStyle.textRegular(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
