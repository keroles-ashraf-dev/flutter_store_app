import 'package:store/core/network/api_constant.dart';
import 'package:store/data/model/deal_model.dart';
import 'package:store/data/model/get_deal_request_model.dart';

import '../../../core/network/api_manager.dart';

abstract class BaseDealRemoteDatasource {
  Future<List<DealModel>> getDeals();

  Future<DealModel> getDeal(GetDealRequestModel getDealRequestModel);
}

class DealRemoteDatasourceImpl implements BaseDealRemoteDatasource {
  final ApiManager _apiManager;

  DealRemoteDatasourceImpl(this._apiManager);

  @override
  Future<List<DealModel>> getDeals() async {
    try {
      final res = await _apiManager().get(
        ApiConstant.dealsUri,
        sendAuth: false,
      );

      final jsonData = res.data[ApiConstant.resDataKey];
      final dealsData = jsonData[ApiConstant.resDataDealsKey];
      final dealsList = dealsData as List;
      final deals = dealsList.map((e) => DealModel.fromJson(e));

      return List<DealModel>.from(deals);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DealModel> getDeal(GetDealRequestModel getDealRequestModel) async {
    try {
      final res = await _apiManager().get(
        ApiConstant.dealUri,
        sendAuth: false,
        params: getDealRequestModel.toJson(),
      );

      final jsonData = res.data[ApiConstant.resDataKey];
      final dealData = jsonData[ApiConstant.resDataDealKey];
      final deal = DealModel.fromJson(dealData);

      return deal;
    } catch (e) {
      rethrow;
    }
  }
}
