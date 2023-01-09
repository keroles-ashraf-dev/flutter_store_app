import '../../domain/entity/address.dart';
import '../model/address_model.dart';

extension AddressMapper on Address {
  AddressModel get toModel {
    return AddressModel(
      id: id,
      country: country,
      state: state,
      city: city,
      area: area,
      street: street,
      building: building,
      floor: floor,
      landMark: landMark,
      postCode: postCode,
    );
  }
}

extension AddressModelMapper on AddressModel {
  Address get toEntity {
    return Address(
      id: id,
      country: country,
      state: state,
      city: city,
      area: area,
      street: street,
      building: building,
      floor: floor,
      landMark: landMark,
      postCode: postCode,
    );
  }
}
