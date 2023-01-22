import 'package:equatable/equatable.dart';

import '../../core/util/app_constant.dart';

class User extends Equatable {
  final int id;
  final String authToken;
  final String fcmToken;
  final String chatSocketId;
  final String firstName;
  final String lastName;
  final String email;
  final int emailVerified;
  final String phone;
  final int phoneVerified;
  final int created;
  final int status;
  final int defaultAddressId;

  const User({
    required this.id,
    required this.authToken,
    required this.fcmToken,
    required this.chatSocketId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerified,
    required this.phone,
    required this.phoneVerified,
    required this.created,
    required this.status,
    required this.defaultAddressId,
  });

  /// return empty object
  const User.empty({
    this.id = AppConstant.emptyInt,
    this.authToken = AppConstant.emptyStr,
    this.fcmToken = AppConstant.emptyStr,
    this.chatSocketId = AppConstant.emptyStr,
    this.firstName = AppConstant.emptyStr,
    this.lastName = AppConstant.emptyStr,
    this.email = AppConstant.emptyStr,
    this.emailVerified = AppConstant.emptyInt,
    this.phone = AppConstant.emptyStr,
    this.phoneVerified = AppConstant.emptyInt,
    this.created = AppConstant.emptyInt,
    this.status = AppConstant.emptyInt,
    this.defaultAddressId = AppConstant.emptyInt,
  });

  @override
  List<Object> get props => [
        id,
        authToken,
        fcmToken,
        chatSocketId,
        firstName,
        lastName,
        email,
        emailVerified,
        phone,
        phoneVerified,
        created,
        status,
        defaultAddressId,
      ];
}
