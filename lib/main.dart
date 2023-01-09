import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:store/core/cache/cache_manager.dart';
import 'package:store/core/util/app_prefs.dart';

import 'app.dart';
import 'core/debug/bloc_observer.dart';
import 'core/debug/function.dart';
import 'core/i18n/app_localization.dart';
import 'core/util/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// bloc observer -> for debugging only
  if (isDebug) {
    Bloc.observer = MyBlocObserver();
  }

  /// setup app dependency injection
  initDI();

  /// init app preferences (language, theme, etc)
  await di<AppPrefs>().init();

  /// init app cache
  await di<CacheManager>().init();

  /// setup app localization (define json localization files path)
  AppLocalization.init();

  /// phoenix for restart app on (theme, language) changing
  runApp(Phoenix(child: const MyApp()));
}
