import 'package:dio/dio.dart';
import 'package:store/core/error/error_handling.dart';
import 'package:store/core/network/dio_factory.dart';

import '../error/exception.dart';
import '../util/app_prefs.dart';
import 'api_constant.dart';

abstract class ApiClient {
  final AppPrefs _appPrefs;
  final ErrorHandler _errorHandler;
  late final Map<String, String> defaultHeaders;

  ApiClient(this._appPrefs, this._errorHandler);

  /// get request
  Future<dynamic> get(
    String uri, {
    bool sendAuth = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  });

  /// post request
  Future<dynamic> post(
    String uri,
    dynamic body, {
    bool sendAuth = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  });

  /// update request
  Future<dynamic> put(
    String uri,
    dynamic body, {
    bool sendAuth = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  });

  /// delete request
  Future<dynamic> delete(
    String uri,
    dynamic body, {
    bool sendAuth = true,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  });
}

class DioClient implements ApiClient {
  late final DioFactory _dioFactory;
  late final BaseOptions options;

  @override
  final AppPrefs _appPrefs;
  @override
  final ErrorHandler _errorHandler;
  @override
  late final Map<String, String> defaultHeaders;

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
    Map<String, dynamic>? params,
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
    Map<String, dynamic>? params,
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
    Map<String, dynamic>? params,
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
    Map<String, dynamic>? params,
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
  Dio _initDio(bool sendAuth, Map<String, dynamic>? headers,
      Map<String, dynamic>? params) {
    final Dio dio = _dioFactory();

    /// replace default headers by passed one
    if (headers != null) options.headers = headers;

    /// remove authorization from default headers
    if (headers == null && !sendAuth) {
      defaultHeaders.remove(ApiConstant.headerAuthorizationKey);
      options.headers = defaultHeaders;
    }

    /// set parameters if passed
    if (params != null) {
      options.queryParameters = params;
    }

    dio.options = options;

    return dio;
  }
}
