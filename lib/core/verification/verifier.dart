import 'package:flutter/material.dart';
import 'package:store/core/session/session.dart';

import '../navigation/app_navigator.dart';
import '../navigation/routes.dart';

class Verifier {
  final Session _session;

  Verifier(this._session);

  Future<void> _verifyLogin(BuildContext context, {String? route}) async {
    if (_session.isLoggedIn) return;

    await AppNavigator.replace(context, route ?? Routes.routeLogin);
  }
}
