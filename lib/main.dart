import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:store/app/service_locator/service_locator.dart';

import 'app/app.dart';
import 'app/debug/bloc_observer.dart';
import 'app/debug/function.dart';
import 'app/i18n/app_localization.dart';
import 'app/util/app_prefs.dart';
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
  ServiceLocator.initAppModule();

  /// setup app localization (define json localization files path)
  AppLocalization.init();

  /// phoenix for restart app on (theme, language) changing
  runApp(Phoenix(child: MyApp()));
}
