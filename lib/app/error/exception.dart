import 'failure.dart';

class ServerException implements Exception {
  final ServerFailure serverFailure;

  ServerException(this.serverFailure);
}

class CacheException implements Exception {
  final CacheFailure cacheFailure;

  CacheException(this.cacheFailure);
}
