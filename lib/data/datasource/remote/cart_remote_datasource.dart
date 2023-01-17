import 'package:store/core/network/api_constant.dart';
import 'package:store/data/model/cart_model.dart';
import 'package:store/data/model/get_cart_request_model.dart';

import '../../../core/network/api_manager.dart';

abstract class BaseCartRemoteDatasource {
  Future<CartModel> getCart(GetCartRequestModel requestModel);
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
}
