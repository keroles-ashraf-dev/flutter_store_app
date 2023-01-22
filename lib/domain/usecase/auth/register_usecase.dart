import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import 'package:store/domain/entity/register_request.dart';
import 'package:store/domain/entity/user.dart';
import 'package:store/domain/repository/base_auth_repository.dart';

import '../base/base_usecase.dart';

class RegisterUsecase extends BaseUsecase<User, RegisterRequest> {
  final BaseAuthRepository _authRepository;

  RegisterUsecase(this._authRepository);

  @override
  Future<Either<Failure, User>> call(RegisterRequest params) async {
    return await _authRepository.register(params);
  }
}
