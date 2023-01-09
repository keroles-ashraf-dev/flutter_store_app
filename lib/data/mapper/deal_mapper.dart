import 'package:store/data/model/deal_model.dart';
import 'package:store/data/model/get_deal_request_model.dart';
import 'package:store/domain/entity/deal.dart';
import 'package:store/domain/entity/get_deal_request.dart';

extension DealModelMapper on DealModel {
  Deal get toEntity {
    return Deal(
      id: id,
      productId: productId,
      name: name,
      image: image,
      price: price,
      discountedPrice: discountedPrice,
      rating: rating,
      ratersCount: ratersCount,
    );
  }
}

extension DealMapper on Deal {
  DealModel get toModel {
    return DealModel(
      id: id,
      productId: productId,
      name: name,
      image: image,
      price: price,
      discountedPrice: discountedPrice,
      rating: rating,
      ratersCount: ratersCount,
    );
  }
}

extension GetDealRequestMapper on GetDealRequest {
  GetDealRequestModel get toModel {
    return GetDealRequestModel(
      id: id,
    );
  }
}
