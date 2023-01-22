import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core/debug/function.dart';

/// callable class
class DioFactory {
  Dio call() {
    final Dio dio = Dio();

    if (isDebug) {
      /// its debug mode so print api logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    /// return dio object
    return dio;
  }
}
