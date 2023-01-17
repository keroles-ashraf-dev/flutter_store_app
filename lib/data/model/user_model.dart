import 'package:store/app/util/extension.dart';
import 'package:store/domain/entity/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.authToken,
    required super.fcmToken,
    required super.chatSocketId,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.emailVerified,
    required super.phone,
    required super.phoneVerified,
    required super.created,
    required super.status,
    required super.defaultAddressId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        authToken: json['token'],
        fcmToken: json['fcm_token'].toString().orEmpty(),
        chatSocketId: json['chat_socket_id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        emailVerified: json['email_verified'],
        phone: json['phone'],
        phoneVerified: json['phone_verified'],
        created: json['created'],
        status: json['status'],
        defaultAddressId: json['default_address_id'],
      );
}
