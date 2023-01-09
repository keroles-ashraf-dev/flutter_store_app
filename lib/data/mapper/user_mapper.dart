import '../../domain/entity/user.dart';
import '../model/user_model.dart';

extension UserMapper on User {
  UserModel get toModel {
    return UserModel(
      id: id,
      authToken: authToken,
      fcmToken: fcmToken,
      chatSocketId: chatSocketId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      emailVerified: emailVerified,
      phone: phone,
      phoneVerified: phoneVerified,
      created: created,
      status: status,
      defaultAddressId: defaultAddressId,
    );
  }
}

extension UserModelMapper on UserModel {
  User get toEntity {
    return User(
      id: id,
      authToken: authToken,
      fcmToken: fcmToken,
      chatSocketId: chatSocketId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      emailVerified: emailVerified,
      phone: phone,
      phoneVerified: phoneVerified,
      created: created,
      status: status,
      defaultAddressId: defaultAddressId,
    );
  }
}
