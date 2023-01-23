import 'package:store/domain/entity/get_product_request.dart';

class GetProductRequestModel extends GetProductRequest {
  const GetProductRequestModel({
    required super.id,
  });

  factory GetProductRequestModel.fromJson(Map<String, dynamic> json) {
    return GetProductRequestModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
