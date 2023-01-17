import 'package:flutter/material.dart';
import 'package:store/app/util/extension.dart';

import '../navigation/routes.dart';
import '../service_locator/service_locator.dart';
import '../session/session.dart';

class Verifier {
  static RouteSettings verify(RouteSettings routeSettings) {
    if (_isLoginRequired(routeSettings.name.orEmpty())) {
      return _verifyLoginAction(routeSettings);
    }
    return routeSettings;
  }

  static bool _isLoginRequired(String route) {
    final List<String> loginRequiredRoutes = [Routes.routeCart];

    for (String e in loginRequiredRoutes) {
      if (e == route) return true;
    }
    return false;
  }

  static RouteSettings _verifyLoginAction(RouteSettings routeSettings) {
    if (sl<Session>().isLoggedIn) return routeSettings;

    return const RouteSettings(name: Routes.routeLogin);
  }
}
