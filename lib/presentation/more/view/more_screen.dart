import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/presentation/more/component/more_item_widget.dart';

import '../../../app/i18n/app_string.dart';
import '../../../app/navigation/routes.dart';
import '../../../app/service_locator/service_locator.dart';
import '../../../app/session/session.dart';
import '../../resource/size_manager.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSize.marginHeightDoubleExtraSmall,
        horizontal: AppSize.marginWidthExtraSmall,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MoreItemWidget(
              title: AppString.theme.i18n(),
              leading: Icon(Icons.mode_night_outlined, size: AppSize.iconSmall),
              route: Routes.routeTheme,
            ),
            MoreItemWidget(
              title: AppString.language.i18n(),
              leading: Icon(Icons.translate, size: AppSize.iconSmall),
              route: Routes.routeLanguage,
            ),
            MoreItemWidget(
              title: AppString.support.i18n(),
              leading:
                  Icon(Icons.contact_support_outlined, size: AppSize.iconSmall),
              route: Routes.routeSupport,
            ),
            MoreItemWidget(
              title: AppString.about.i18n(),
              leading: Icon(Icons.info_outline, size: AppSize.iconSmall),
              route: Routes.routeAbout,
            ),
            Visibility(
              visible: sl<Session>().isLoggedIn,
              replacement: MoreItemWidget(
                title: AppString.login.i18n(),
                leading: Icon(Icons.login, size: AppSize.iconSmall),
                route: Routes.routeLogin,
              ),
              child: MoreItemWidget(
                title: AppString.logout.i18n(),
                leading:
                    Icon(Icons.power_settings_new, size: AppSize.iconSmall),
                route: Routes.routeLogout,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
