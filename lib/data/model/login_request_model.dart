import 'package:store/domain/entity/login_request.dart';

class LoginRequestModel extends LoginRequest {
  const LoginRequestModel({
    required super.email,
    required super.password,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
