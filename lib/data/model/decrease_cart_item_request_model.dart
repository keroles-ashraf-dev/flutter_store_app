import '../../domain/entity/decrease_cart_item_request.dart';

class DecreaseCartItemRequestModel extends DecreaseCartItemRequest {
  const DecreaseCartItemRequestModel({
    required super.userId,
    required super.productId,
  });

  factory DecreaseCartItemRequestModel.fromJson(Map<String, dynamic> json) {
    return DecreaseCartItemRequestModel(
      userId: json['user_id'],
      productId: json['product_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user-id": userId,
      "product-id": productId,
    };
  }
}
