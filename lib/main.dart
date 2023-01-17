import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:store/core/cache/cache_manager.dart';
import 'package:store/core/util/app_prefs.dart';

import 'app.dart';
import 'core/debug/bloc_observer.dart';
import 'core/debug/function.dart';
import 'core/i18n/app_localization.dart';
import 'core/service_locator/app_module.dart';

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

  /// setup app service locator
  AppModule().init();

  /// setup app localization (define json localization files path)
  AppLocalization.init();

  /// phoenix for restart app on (theme, language) changing
  runApp(Phoenix(child: MyApp()));
}
