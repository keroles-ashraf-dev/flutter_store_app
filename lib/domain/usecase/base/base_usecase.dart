import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

/// callable class
/// out -> extenders returned type
/// in -> extenders passed parameters type
abstract class BaseUsecase<Out, In> {
  Future<Either<Failure, Out>> call(In params);
}
