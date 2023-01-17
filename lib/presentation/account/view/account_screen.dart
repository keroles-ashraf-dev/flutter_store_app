import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/service_locator/app_module.dart';

import 'package:store/core/util/size_manager.dart';

import '../../../core/navigation/app_navigator.dart';
import '../../../core/navigation/routes.dart';
import '../../../domain/entity/user.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSize.marginHeightExtraLarge,
        horizontal: AppSize.marginWidthSmall,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!AppModule().isRegistered<User>())
            InkWell(
                onTap: () {
                  AppNavigator.push(context, Routes.routeLogin);
                },
                child: Text(AppString.login.i18n())),
        ],
      ),
    );
  }
}
