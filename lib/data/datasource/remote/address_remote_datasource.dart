import 'package:store/core/network/api_constant.dart';
import 'package:store/data/model/address_model.dart';
import 'package:store/data/model/get_address_request_model.dart';

import '../../../core/network/api_manager.dart';

abstract class BaseAddressRemoteDatasource {
  Future<List<AddressModel>> getAddresses();

  Future<AddressModel> getAddress(
      GetAddressRequestModel getAddressRequestModel);
}

class AddressRemoteDatasourceImpl implements BaseAddressRemoteDatasource {
  final ApiManager _apiManager;

  AddressRemoteDatasourceImpl(this._apiManager);

  @override
  Future<List<AddressModel>> getAddresses() async {
    try {
      final res = await _apiManager().get(
        ApiConstant.addressesUri,
        sendAuth: false,
      );

      final jsonData = res.data[ApiConstant.resDataKey];
      final addressesData = jsonData[ApiConstant.resDataAddressesKey];
      final addressesList = addressesData as List;
      final addresses = addressesList.map((e) => AddressModel.fromJson(e));

      return List<AddressModel>.from(addresses);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AddressModel> getAddress(
      GetAddressRequestModel getAddressRequestModel) async {
    try {
      final res = await _apiManager().get(
        ApiConstant.addressUri,
        sendAuth: true,
        params: getAddressRequestModel.toJson(),
      );

      final jsonData = res.data[ApiConstant.resDataKey];
      final addressData = jsonData[ApiConstant.resDataAddressKey];
      final AddressModel address;

      if (addressData != null) {
        address = AddressModel.fromJson(addressData);
      } else {
        final country = jsonData[ApiConstant.resDataCountryKey];
        address = AddressModel.some(country: country);
      }

      return address;
    } catch (e) {
      rethrow;
    }
  }
}
