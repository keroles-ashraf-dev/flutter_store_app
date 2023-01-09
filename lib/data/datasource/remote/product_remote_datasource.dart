import 'package:store/core/network/api_constant.dart';
import 'package:store/data/model/product_model.dart';

import '../../../core/network/api_manager.dart';

abstract class BaseProductRemoteDatasource {
  Future<List<ProductModel>> getDeals();
}

class ProductRemoteDatasourceImpl implements BaseProductRemoteDatasource {
  final ApiManager _apiManager;

  ProductRemoteDatasourceImpl(this._apiManager);

  @override
  Future<List<ProductModel>> getDeals() async {
    try {
      final res = await _apiManager().get(
        ApiConstant.dealsUri,
        sendAuth: false,
      );

      final deals = res.data['data'] as List;

      final dealsList = deals.map((e) => ProductModel.fromJson(e));

      return List<ProductModel>.from(dealsList);
    } catch (e) {
      rethrow;
    }
  }
}
