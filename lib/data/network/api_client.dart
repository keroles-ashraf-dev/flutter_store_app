import 'package:dio/dio.dart';

import '../../core/error/error_handling.dart';
import '../../core/error/exception.dart';
import '../../core/util/app_constant.dart';
import '../../core/util/app_prefs.dart';
import 'api_constant.dart';
import 'dio_factory.dart';

abstract class ApiClient {
  /// get request
  Future<dynamic> get(
    String uri, {
    bool sendAuth = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic> params = AppConstant.emptyStrMap,
  });

  /// post request
  Future<dynamic> post(
    String uri,
    dynamic body, {
    bool sendAuth = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic> params = AppConstant.emptyStrMap,
  });

  /// update request
  Future<dynamic> put(
    String uri,
    dynamic body, {
    bool sendAuth = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic> params = AppConstant.emptyStrMap,
  });

  /// delete request
  Future<dynamic> delete(
    String uri,
    dynamic body, {
    bool sendAuth = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic> params = AppConstant.emptyStrMap,
  });
}

class DioClient implements ApiClient {
  final AppPrefs _appPrefs;
  final ErrorHandler _errorHandler;

  late final DioFactory _dioFactory;
  late final Map<String, String> defaultHeaders;
  late final BaseOptions options;

  DioClient(this._appPrefs, this._errorHandler) {
    _dioFactory = DioFactory();

    defaultHeaders = {
      ApiConstant.headerContentTypeKey: ApiConstant.headerValueApplicationJson,
      ApiConstant.headerAcceptKey: ApiConstant.headerValueApplicationJson,
      ApiConstant.headerApiKey: ApiConstant.apiKey,
      ApiConstant.headerAuthorizationKey: _appPrefs.authToken,
    };

    options = BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      headers: defaultHeaders,
      receiveTimeout: ApiConstant.apiTimeOut,
      sendTimeout: ApiConstant.apiTimeOut,
      connectTimeout: ApiConstant.apiTimeOut,
    );
  }

  /// get request
  @override
  Future<dynamic> get(
    String uri, {
    bool sendAuth = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic> params = AppConstant.emptyStrMap,
  }) async {
    final Dio dio = _initDio(sendAuth, headers, params);

    try {
      final res = await dio.get(uri);

      return res;
    } catch (e) {
      throw ServerException(_errorHandler.serverError(error: e));
    }
  }

  /// post request
  @override
  Future<dynamic> post(
    String uri,
    dynamic body, {
    bool sendAuth = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic> params = AppConstant.emptyStrMap,
  }) async {
    final Dio dio = _initDio(sendAuth, headers, params);

    try {
      final res = await dio.post(uri, data: body);

      return res;
    } catch (e) {
      throw ServerException(_errorHandler.serverError(error: e));
    }
  }

  /// update request
  @override
  Future<dynamic> put(
    String uri,
    dynamic body, {
    bool sendAuth = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic> params = AppConstant.emptyStrMap,
  }) async {
    final Dio dio = _initDio(sendAuth, headers, params);

    try {
      final res = await dio.put(uri, data: body);

      return res;
    } catch (e) {
      throw ServerException(_errorHandler.serverError(error: e));
    }
  }

  /// delete request
  @override
  Future<dynamic> delete(
    String uri,
    dynamic body, {
    bool sendAuth = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic> params = AppConstant.emptyStrMap,
  }) async {
    final Dio dio = _initDio(sendAuth, headers, params);

    try {
      final res = await dio.delete(uri, data: body);

      return res;
    } catch (e) {
      throw ServerException(_errorHandler.serverError(error: e));
    }
  }

  /// init dio instance
  Dio _initDio(
    bool sendAuth,
    Map<String, dynamic>? headers,
    Map<String, dynamic> params,
  ) {
    final Dio dio = _dioFactory();

    /// replace default headers by passed one
    if (headers != null) options.headers = headers;

    /// remove authorization from default headers
    if (headers == null && !sendAuth) {
      defaultHeaders.remove(ApiConstant.headerAuthorizationKey);
      options.headers = defaultHeaders;
    }

    /// set passed parameters
    options.queryParameters = params;

    dio.options = options;

    return dio;
  }
}
