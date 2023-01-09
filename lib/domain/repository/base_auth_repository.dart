import 'package:dartz/dartz.dart';
import 'package:store/domain/entity/register_request.dart';

import '../../core/error/failure.dart';
import '../entity/login_request.dart';
import '../entity/user.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, User>> login(LoginRequest loginRequest);

  Future<Either<Failure, User>> register(RegisterRequest registerRequest);
}
