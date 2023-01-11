import 'package:store/domain/entity/get_deal_request.dart';

import '../../domain/entity/get_address_request.dart';

class GetAddressRequestModel extends GetAddressRequest {
  const GetAddressRequestModel({
    required super.id,
  });

  factory GetAddressRequestModel.fromJson(Map<String, dynamic> json) {
    return GetAddressRequestModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
