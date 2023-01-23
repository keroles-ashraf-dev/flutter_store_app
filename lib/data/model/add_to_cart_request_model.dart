import 'package:store/domain/entity/add_to_cart_request.dart';

class AddToCartRequestModel extends AddToCartRequest {
  const AddToCartRequestModel({
    required super.userId,
    required super.productId,
  });

  factory AddToCartRequestModel.fromJson(Map<String, dynamic> json) {
    return AddToCartRequestModel(
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
