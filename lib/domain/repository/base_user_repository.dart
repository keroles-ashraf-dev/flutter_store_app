import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entity/user.dart';

abstract class BaseUserRepository {
  Future<Either<Failure, User>> getUserData();
}
