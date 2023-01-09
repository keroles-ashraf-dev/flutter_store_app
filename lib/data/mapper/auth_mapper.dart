import 'package:store/data/model/login_request_model.dart';
import 'package:store/domain/entity/login_request.dart';

import '../../domain/entity/register_request.dart';
import '../model/register_request_model.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestModel get toModel {
    return LoginRequestModel(email: email, password: password);
  }
}

extension RegisterRequestMapper on RegisterRequest {
  RegisterRequestModel get toModel {
    return RegisterRequestModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
