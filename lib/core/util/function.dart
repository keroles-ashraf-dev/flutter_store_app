Future<void> sleep({int seconds = 1}) async {
  await Future<void>.delayed(Duration(seconds: seconds));
}

Future<void> delay({Function? fun, int seconds = 1}) async {
  await sleep(seconds: seconds);
  if (fun != null) await fun();
}

int currentTimestamp() {
  int milliseconds = DateTime.now().millisecondsSinceEpoch;
  int secondsSinceEpoch = milliseconds ~/ Duration.millisecondsPerSecond;

  return secondsSinceEpoch;
}
