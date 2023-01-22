import 'package:store/domain/entity/address.dart';

import '../../core/util/app_constant.dart';
import '../../core/util/app_constant.dart';


class AddressModel extends Address {
  const AddressModel(
      {required super.id,
      required super.country,
      required super.state,
      required super.city,
      required super.area,
      required super.street,
      required super.building,
      required super.floor,
      required super.landMark,
      required super.postCode});

  /// return object with only passed values
  const AddressModel.some({
    super.id = AppConstant.emptyInt,
    super.country = AppConstant.emptyStr,
    super.state = AppConstant.emptyStr,
    super.city = AppConstant.emptyStr,
    super.area = AppConstant.emptyStr,
    super.street = AppConstant.emptyStr,
    super.building = AppConstant.emptyStr,
    super.floor = AppConstant.emptyInt,
    super.landMark = AppConstant.emptyStr,
    super.postCode = AppConstant.emptyStr,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: int.parse(json["id"]),
      country: json["country"],
      state: json["state"],
      city: json["city"],
      area: json["area"],
      street: json["street"],
      building: json["building"],
      floor: json["floor"],
      landMark: json["nearest_landMark"],
      postCode: json["postCode"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "country": country,
      "state": state,
      "city": city,
      "area": area,
      "street": street,
      "building": building,
      "floor": floor,
      "landMark": landMark,
      "postCode": postCode,
    };
  }
}
