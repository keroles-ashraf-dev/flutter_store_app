import 'package:dartz/dartz.dart';

import '../../app/error/failure.dart';
import '../entity/user.dart';

abstract class BaseUserRepository {
  Future<Either<Failure, User>> getUserData();
}
