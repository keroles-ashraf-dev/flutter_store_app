import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/core/i18n/app_localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/theme/app_theme.dart';
import 'package:store/core/util/extension.dart';

class AppPrefsKeys {
  static const String language = 'PREFS_KEY_LANGUAGE';
  static const String theme = 'PREFS_KEY_THEME';
  static const String authToken = 'PREFS_KEY_AUTH_TOKEN';
}

class AppPrefs {
  late final SharedPreferences _prefs;
  late String _language;
  late String _theme;
  late String _authToken;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    _language = _prefs.getString(AppPrefsKeys.language) ?? AppLocalization.system;
    _theme = _prefs.getString(AppPrefsKeys.theme) ?? AppTheme.system;
    _authToken = _prefs.getString(AppPrefsKeys.authToken).orEmpty();
  }

  String get appLanguage => _language;

  String get appTheme => _theme;

  String get authToken => _authToken;

  Future<bool> setAppLanguage(String lang) async {
    bool success = await _prefs.setString(AppPrefsKeys.language, lang);

    if (success) _language = lang;

    return success;
  }

  Future<bool> setAppTheme(String theme) async {
    bool success = await _prefs.setString(AppPrefsKeys.theme, theme);

    if (success) _theme = theme;

    return success;
  }

  Future<bool> setAuthToken(String token) async {
    bool success = await _prefs.setString(AppPrefsKeys.authToken, token);

    if (success) _authToken = token;

    return success;
  }
}
