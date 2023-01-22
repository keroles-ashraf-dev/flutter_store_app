import 'package:store/data/model/cart_model.dart';
import 'package:store/data/model/get_cart_request_model.dart';
import 'package:store/data/model/increase_cart_item_request_model.dart';

import '../../model/decrease_cart_item_request_model.dart';
import '../../network/api_constant.dart';
import '../../network/api_manager.dart';

abstract class BaseCartRemoteDatasource {
  Future<CartModel> getCart(GetCartRequestModel requestModel);

  Future<CartModel> increaseCartItem(IncreaseCartItemRequestModel requestModel);

  Future<CartModel> decreaseCartItem(DecreaseCartItemRequestModel requestModel);
}

class CartRemoteDatasourceImpl implements BaseCartRemoteDatasource {
  final ApiManager _apiManager;

  CartRemoteDatasourceImpl(this._apiManager);

  @override
  Future<CartModel> getCart(GetCartRequestModel requestModel) async {
    try {
      final res = await _apiManager().get(
        ApiConstant.cartUri,
        sendAuth: true,
        params: requestModel.toJson(),
      );

      final jsonData = res.data[ApiConstant.resDataKey];
      final cartObj = jsonData[ApiConstant.resDataCartKey];

      return CartModel.fromJson(cartObj);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CartModel> increaseCartItem(IncreaseCartItemRequestModel requestModel) async {
    try {
      final res = await _apiManager().post(
        ApiConstant.increaseCartItemUri,
        requestModel.toJson(),
        sendAuth: true,
      );

      final jsonData = res.data[ApiConstant.resDataKey];
      final cartObj = jsonData[ApiConstant.resDataCartKey];

      return CartModel.fromJson(cartObj);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CartModel> decreaseCartItem(DecreaseCartItemRequestModel requestModel) async {
    try {
      final res = await _apiManager().post(
        ApiConstant.decreaseCartItemUri,
        requestModel.toJson(),
        sendAuth: true,
      );

      final jsonData = res.data[ApiConstant.resDataKey];
      final cartObj = jsonData[ApiConstant.resDataCartKey];

      return CartModel.fromJson(cartObj);
    } catch (e) {
      rethrow;
    }
  }
}
