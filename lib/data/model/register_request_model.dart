import 'package:store/domain/entity/register_request.dart';

class RegisterRequestModel extends RegisterRequest {
  const RegisterRequestModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.password,
    required super.confirmPassword,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
      confirmPassword: json["confirm_password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "first-name": firstName,
      "last-name": lastName,
      "email": email,
      "phone": phone,
      "password": password,
      "confirm-password": confirmPassword,
    };
  }
}
