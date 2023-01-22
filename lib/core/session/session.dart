import 'package:store/domain/entity/user.dart';

import '../util/app_prefs.dart';

class Session {
  final AppPrefs _appPrefs;

  Session(this._appPrefs);

  User _user = const User.empty();

  bool get isLoggedIn => _appPrefs.authToken.isNotEmpty;

  User get user => _user;

  String get token => _user.authToken;

  int get userId => _user.id;

  Future<bool> login(User user) async {
    final success = await _appPrefs.setAuthToken(user.authToken);

    if (!success) return false;

    start(user);

    return true;
  }

  Future<bool> logout() async {
    final success = await _appPrefs.removeAuthToken();

    if (!success) return false;

    finish();

    return true;
  }

  Future<bool> start(User user) async {
    final success = await _appPrefs.setAuthToken(user.authToken);
    if (!success) return false;

    _setUser(user);

    return true;
  }

  void finish() {
    _removeUser();
  }

  void _setUser(User user) {
    _user = user;
  }

  void _removeUser() {
    _user = const User.empty();
  }
}
