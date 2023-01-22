import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:store/core/service_locator/service_locator.dart';

import '../../data/cache/cache_manager.dart';
import 'app_prefs.dart';

Future<void> restartApp(BuildContext context, {bool rebuildModules = false}) async {
  if (!rebuildModules) return Phoenix.rebirth(context);

  await ServiceLocator.reset();

  /// init app preferences (language, theme, etc)
  await AppPrefs().init();

  /// init app cache
  await CacheManager().init();

  /// setup app module
  ServiceLocator.initCoreModule();

  Phoenix.rebirth(context);
}
