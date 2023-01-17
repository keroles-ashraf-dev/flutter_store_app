import 'package:equatable/equatable.dart';

import '../../core/util/app_constant.dart';

class Address extends Equatable {
  final int id;
  final String country;
  final String state;
  final String city;
  final String area;
  final String street;
  final String building;
  final int floor;
  final String landMark;
  final String postCode;

  const Address({
    required this.id,
    required this.country,
    required this.state,
    required this.city,
    required this.area,
    required this.street,
    required this.building,
    required this.floor,
    required this.landMark,
    required this.postCode,
  });

  /// return empty object
  const Address.empty({
    this.id = AppConstant.emptyInt,
    this.country = AppConstant.emptyStr,
    this.state = AppConstant.emptyStr,
    this.city = AppConstant.emptyStr,
    this.area = AppConstant.emptyStr,
    this.street = AppConstant.emptyStr,
    this.building = AppConstant.emptyStr,
    this.floor = AppConstant.emptyInt,
    this.landMark = AppConstant.emptyStr,
    this.postCode = AppConstant.emptyStr,
  });

  @override
  List<Object> get props => [
        id,
        country,
        state,
        city,
        area,
        street,
    building,
        floor,
        landMark,
        postCode,
      ];
}
