import 'package:dio/dio.dart';
import 'package:localization/localization.dart';
import 'package:store/core/debug/function.dart';
import 'package:store/core/util/app_constant.dart';

import '../i18n/app_string.dart';
import 'failure.dart';

class ErrorHandler {
  ServerFailure serverError({dynamic error}) {
    if (error is DioError) {
      /// if error from dio, handle it
      return _handleApiClientError(error);
    }

    /// else return default msg
    return ServerFailureEnum.defaultError.failure();
  }

  LocalFailure localError({dynamic error}) {
    return LocalFailureEnum.internetError.failure();
  }

  CacheFailure cacheError({dynamic error}) {
    return CacheFailureEnum.defaultError.failure();
  }

  ServerFailure _handleApiClientError(DioError e) {
    /// if error type is response and msg is not null then return msg
    if (e.type == DioErrorType.response &&
        e.response != null &&
        e.response!.data != null &&
        e.response!.data != AppConstant.emptyStr &&
        e.response!.data['message'] != null) {
      return ServerFailure(e.response!.data['message']);
    }

    /// else return default msg
    return ServerFailureEnum.defaultError.failure();
  }
}

enum ServerFailureEnum {
  defaultError,
}

enum LocalFailureEnum {
  internetError,
}

enum CacheFailureEnum {
  defaultError,
}

extension ServerFailureEnumExtension on ServerFailureEnum {
  ServerFailure failure() {
    switch (this) {
      case ServerFailureEnum.defaultError:
        return ServerFailure(ErrorMessage.serverError.i18n());
    }
  }
}

extension LocalFailureEnumExtension on LocalFailureEnum {
  LocalFailure failure() {
    switch (this) {
      case LocalFailureEnum.internetError:
        return LocalFailure(ErrorMessage.noInternetConnection.i18n());
    }
  }
}

extension CacheFailureEnumExtension on CacheFailureEnum {
  CacheFailure failure() {
    switch (this) {
      case CacheFailureEnum.defaultError:
        return CacheFailure(ErrorMessage.cacheError.i18n());
    }
  }
}

class ErrorMessage {
  /// server status message
  static const String serverError = AppString.serverError;

  /// local status message
  static const String noInternetConnection = AppString.noInternetError;

  /// cache status message
  static const String cacheError = AppString.cacheError;
}
