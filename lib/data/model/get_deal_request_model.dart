import 'package:store/domain/entity/get_deal_request.dart';

class GetDealRequestModel extends GetDealRequest {
  const GetDealRequestModel({
    required super.id,
  });

  factory GetDealRequestModel.fromJson(Map<String, dynamic> json) {
    return GetDealRequestModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
