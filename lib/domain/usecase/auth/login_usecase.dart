import 'package:dartz/dartz.dart';
import 'package:store/core/error/failure.dart';
import 'package:store/domain/entity/login_request.dart';
import 'package:store/domain/entity/user.dart';
import 'package:store/domain/repository/base_auth_repository.dart';

import '../base/base_usecase.dart';

class LoginUsecase extends BaseUsecase<User, LoginRequest> {
  final BaseAuthRepository _authRepository;

  LoginUsecase(this._authRepository);

  @override
  Future<Either<Failure, User>> call(LoginRequest params) async {
    return await _authRepository.login(params);
  }
}
