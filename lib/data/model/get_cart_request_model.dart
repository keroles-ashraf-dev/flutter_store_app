import '../../domain/entity/get_cart_request.dart';

class GetCartRequestModel extends GetCartRequest {
  const GetCartRequestModel({
    required super.userId,
  });

  factory GetCartRequestModel.fromJson(Map<String, dynamic> json) {
    return GetCartRequestModel(
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user-id": userId,
    };
  }
}
