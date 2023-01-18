import 'package:flutter/material.dart';
import 'package:store/app/app.dart';

class AppNavigator {
  static void pop(BuildContext context, {result}) {
    MyApp().appNavigatorKey.currentState?.pop(result);
  }

  static Future<void> push(BuildContext context, String route, {dynamic data}) async {
    await MyApp().appNavigatorKey.currentState?.pushNamed(route, arguments: data);
  }

  static Future<void> replace(BuildContext context, String route, {dynamic data}) async {
    await MyApp().appNavigatorKey.currentState?.pushReplacementNamed(route, arguments: data);
  }
}
