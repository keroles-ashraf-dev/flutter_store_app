import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// debug tools

bool get isDebug => kDebugMode;

void log(dynamic message) {
  if (isDebug) {
    developer.log(message.toString());
  }
}
