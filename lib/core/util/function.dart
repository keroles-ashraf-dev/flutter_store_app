import 'package:store/core/util/ui_constant.dart';

Future<void> sleep({int seconds = 1}) async {
  await Future<void>.delayed(Duration(seconds: seconds));
}

Future<void> delay({Function? fun, int seconds = 1}) async {
  await sleep(seconds: seconds);
  if (fun != null) await fun();
}

/// just delay screen changing for beautify purpose
Future<void> delayScreenChanging({int seconds = UIConstant.screenChangeInterval}) async {
  await sleep(seconds: seconds);
}

int currentTimestamp() {
  int milliseconds = DateTime.now().millisecondsSinceEpoch;
  int secondsSinceEpoch = milliseconds ~/ Duration.millisecondsPerSecond;

  return secondsSinceEpoch;
}
