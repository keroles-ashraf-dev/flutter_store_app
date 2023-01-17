import 'package:store/data/model/category_model.dart';

import '../../network/api_constant.dart';
import '../../network/api_manager.dart';

abstract class BaseCategoryRemoteDatasource {
  Future<List<CategoryModel>> getMainCategories();
}

class CategoryRemoteDatasourceImpl implements BaseCategoryRemoteDatasource {
  final ApiManager _apiManager;

  CategoryRemoteDatasourceImpl(this._apiManager);

  @override
  Future<List<CategoryModel>> getMainCategories() async {
    try {
      final res = await _apiManager().get(
        ApiConstant.mainCategoriesUri,
        sendAuth: false,
      );

      final jsonData = res.data[ApiConstant.resDataKey];
      final catsData = jsonData[ApiConstant.resDataCategoriesKey];
      final cats = catsData as List;
      final catsList = cats.map((e) => CategoryModel.fromJson(e));

      return List<CategoryModel>.from(catsList);
    } catch (e) {
      rethrow;
    }
  }
}
