import 'package:flutter/material.dart';
import 'package:store/core/theme/app_theme.dart';
import 'package:store/core/util/app_constant.dart';

import 'core/i18n/app_localization.dart';
import 'core/util/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      localizationsDelegates: AppLocalization.localizationsDelegates(),
      supportedLocales: AppLocalization.supportedLocales,
      localeResolutionCallback: AppLocalization.localeCallback,
      theme: AppTheme.getAppTheme(),
      initialRoute: Routes.routeInitial,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
