import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/theme/app_style.dart';
import 'package:store/core/util/app_navigator.dart';
import 'package:store/core/util/app_routes.dart';

import '../../../core/util/size_manager.dart';
import '../../common/spacer_widget.dart';

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
          style: AppStyle.textLight(
            color: Theme.of(context).disabledColor,
            size: AppSize.fontSmall,
          ),
        ),
        TextButton(
          onPressed: () => AppNavigator.replace(context, Routes.routeRegister),
          child: Text(
            AppString.register.i18n(),
            style: AppStyle.textRegular(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
