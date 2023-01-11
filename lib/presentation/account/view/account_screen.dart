import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/util/app_navigator.dart';
import 'package:store/core/util/app_routes.dart';
import 'package:store/core/util/size_manager.dart';

import '../../../core/util/app_module.dart';
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
          if (!di.isRegistered(instance: User))
            InkWell(onTap: () {
              AppNavigator.push(context, Routes.routeLogin);
            }, child: Text(AppString.login.i18n())),
        ],
      ),
    );
  }
}
