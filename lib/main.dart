import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:store/core/service_locator/service_locator.dart';

import 'app.dart';
import 'core/debug/bloc_observer.dart';
import 'core/debug/function.dart';
import 'core/i18n/app_localization.dart';
import 'core/util/app_prefs.dart';
import 'data/cache/cache_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// bloc observer -> for debugging only
  if (isDebug) {
    Bloc.observer = MyBlocObserver();
  }

  /// init app preferences (language, theme, etc)
  await AppPrefs().init();

  /// init app cache
  await CacheManager().init();

  /// setup app module
  ServiceLocator.initCoreModule();

  /// setup app localization (define json localization files path)
  AppLocalization.init();

  /// phoenix for restart app on (theme, language) changing
  runApp(Phoenix(child: MyApp()));
}
