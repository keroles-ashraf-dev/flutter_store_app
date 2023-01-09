import 'package:flutter/material.dart';

class AppNavigator {
  static void pop(BuildContext context, {result}) {
    Navigator.of(context).pop(result);
  }

  static Future<void> push(BuildContext context, String route,
      {dynamic data}) async {
    await Navigator.of(context).pushNamed(route, arguments: data);
  }

  static Future<void> replace(BuildContext context, String route,
      {dynamic data}) async {
    await Navigator.of(context).pushReplacementNamed(route, arguments: data);
  }
}
