import 'package:store/data/model/get_category_products_request_model.dart';
import 'package:store/data/model/product_model.dart';

import '../../network/api_constant.dart';
import '../../network/api_manager.dart';

abstract class BaseProductRemoteDatasource {
  Future<List<ProductModel>> getCategoryProducts(
      GetCategoryProductsRequestModel requestModel);
}

class ProductRemoteDatasourceImpl implements BaseProductRemoteDatasource {
  final ApiManager _apiManager;

  ProductRemoteDatasourceImpl(this._apiManager);

  @override
  Future<List<ProductModel>> getCategoryProducts(
      GetCategoryProductsRequestModel requestModel) async {
    try {
      final res = await _apiManager().get(
        ApiConstant.categoryProductsUri,
        sendAuth: false,
        params: requestModel.toJson(),
      );

      final data = res.data[ApiConstant.resDataKey];

      final prods = data[ApiConstant.resDataProductsKey] as List;

      final prodsList = prods.map((e) => ProductModel.fromJson(e));

      return List<ProductModel>.from(prodsList);
    } catch (e) {
      rethrow;
    }
  }
}
