import 'package:store/domain/entity/address.dart';

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
}
