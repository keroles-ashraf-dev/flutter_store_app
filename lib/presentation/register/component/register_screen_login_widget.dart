import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/theme/app_style.dart';


import '../../../core/navigation/app_navigator.dart';
import '../../../core/navigation/routes.dart';
import '../../../core/util/size_manager.dart';

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
