import 'package:flutter/material.dart';

import 'i18n/app_localization.dart';
import 'navigation/app_route.dart';
import 'navigation/routes.dart';
import 'theme/app_theme.dart';
import 'util/app_constant.dart';

/// singleton class
class MyApp extends StatelessWidget {
  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  /// we have two Navigator through the app one for MaterialAPP and one
  /// for MainScreenContentWidget so we need to identify each one by a Key
  /// to avoid conflict
  final _appNavigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get appNavigatorKey => _appNavigatorKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      localizationsDelegates: AppLocalization.localizationsDelegates(),
      supportedLocales: AppLocalization.supportedLocales,
      localeResolutionCallback: AppLocalization.localeCallback,
      theme: AppTheme.getAppTheme(),
      navigatorKey: _appNavigatorKey,
      initialRoute: Routes.routeSplash,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
