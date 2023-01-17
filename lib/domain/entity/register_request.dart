import 'package:equatable/equatable.dart';

import '../../app/util/app_constant.dart';

class RegisterRequest extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;

  const RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  /// return empty object
  const RegisterRequest.empty({
    this.firstName = AppConstant.emptyStr,
    this.lastName = AppConstant.emptyStr,
    this.email = AppConstant.emptyStr,
    this.phone = AppConstant.emptyStr,
    this.password = AppConstant.emptyStr,
    this.confirmPassword = AppConstant.emptyStr,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        phone,
        password,
        confirmPassword,
      ];
}
