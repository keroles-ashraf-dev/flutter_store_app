import 'package:store/core/error/error_handling.dart';

import '../util/app_prefs.dart';
import 'api_client.dart';

/// callable class
class ApiManager {
  final AppPrefs _appPrefs;
  final ErrorHandler _errorHandler;

  late final ApiClient _apiClient;

  /// create api client instance
  ApiManager(this._appPrefs, this._errorHandler) {
    _apiClient = DioClient(_appPrefs, _errorHandler);
  }

  /// return api client instance
  ApiClient call() {
    return _apiClient;
  }
}
