import '../../domain/entity/increase_cart_item_request.dart';

class IncreaseCartItemRequestModel extends IncreaseCartItemRequest {
  const IncreaseCartItemRequestModel({
    required super.userId,
    required super.productId,
  });

  factory IncreaseCartItemRequestModel.fromJson(Map<String, dynamic> json) {
    return IncreaseCartItemRequestModel(
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
