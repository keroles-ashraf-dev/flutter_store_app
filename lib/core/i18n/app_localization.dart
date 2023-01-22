import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:store/core/util/asset_manager.dart';

import '../service_locator/service_locator.dart';
import '../util/app_prefs.dart';

enum LanguageEnum { system, english, arabic }

class AppLocalization {
  static LanguageEnum currentLanguage = LanguageEnum.system;
  static Locale currentAppLocale = englishLocale;

  static final String system = LanguageEnum.system.name;
  static final String english = LanguageEnum.english.name;
  static final String arabic = LanguageEnum.arabic.name;

  static const Locale englishLocale = Locale('en', 'US');
  static const Locale arabicLocale = Locale('ar', 'SA');

  static const supportedLocales = [englishLocale, arabicLocale];

  static init() {
    /// define json localization files path
    LocalJsonLocalization.delegate.directories = [AssetPath.localizationPath];
  }

  static bool get isRtl {
    return AppLocalization.currentAppLocale == AppLocalization.arabicLocale;
  }

  static Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates() {
    return [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      LocalJsonLocalization.delegate,
    ];
  }

  /// called on app launching in material app
  /// @var Locale? system locale
  /// @var Iterable<Locale>? app supported locales
  /// @return Locale?
  static Locale? localeCallback(Locale? locale, Iterable<Locale>? supported) {
    if (locale == null || supported == null) {
      currentLanguage = LanguageEnum.english;
      currentAppLocale = englishLocale;
      return englishLocale;
    }

    final String lang = sl<AppPrefs>().appLanguage;

    /// if lang from prefs is system and this lang is in supported locals
    /// then return this lang locale
    if (lang == system && supported.contains(locale)) {
      currentLanguage = LanguageEnum.system;
      currentAppLocale = locale;
      return locale;
    }

    /// if lang from prefs is arabic and this lang is in supported locals
    /// then return this lang locale
    if (lang == arabic && supported.contains(arabicLocale)) {
      currentLanguage = LanguageEnum.arabic;
      currentAppLocale = arabicLocale;
      return arabicLocale;
    }

    /// return english locale as default
    currentLanguage = LanguageEnum.english;
    return englishLocale;
  }
}
