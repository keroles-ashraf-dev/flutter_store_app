import 'package:equatable/equatable.dart';

import '../../app/util/app_constant.dart';

class LoginRequest extends Equatable {
  final String email;
  final String password;

  const LoginRequest({
    required this.email,
    required this.password,
  });

  /// return empty object
  const LoginRequest.empty({
    this.email = AppConstant.emptyStr,
    this.password = AppConstant.emptyStr,
  });

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
