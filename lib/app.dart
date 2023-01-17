import 'package:flutter/material.dart';
import 'package:store/core/theme/app_theme.dart';
import 'package:store/core/util/app_constant.dart';

import 'core/i18n/app_localization.dart';
import 'core/navigation/app_route.dart';
import 'core/navigation/routes.dart';

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
