import 'package:dartz/dartz.dart';
import 'package:store/core/error/failure.dart';
import 'package:store/domain/entity/user.dart';
import 'package:store/domain/repository/base_user_repository.dart';

import '../../entity/no_param.dart';
import '../base/base_usecase.dart';

class GetUserDataUsecase extends BaseUsecase<User, NoParams> {
  final BaseUserRepository _userRepository;

  GetUserDataUsecase(this._userRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await _userRepository.getUserData();
  }
}
