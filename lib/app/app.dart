import 'package:flutter/material.dart';

import 'i18n/app_localization.dart';
import 'navigation/app_route.dart';
import 'navigation/routes.dart';
import 'theme/app_theme.dart';
import 'util/app_constant.dart';

/// singleton class
class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      localizationsDelegates: AppLocalization.localizationsDelegates(),
      supportedLocales: AppLocalization.supportedLocales,
      localeResolutionCallback: AppLocalization.localeCallback,
      theme: AppTheme.getAppTheme(),
      initialRoute: Routes.routeSplash,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
