import 'ui_constant.dart';

/// just delay screen changing for beautify purpose
Future<void> delayScreenChanging({int seconds = UIConstant.screenChangeInterval}) async {
  await Future<void>.delayed(Duration(seconds: seconds));
}
