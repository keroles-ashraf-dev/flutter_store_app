import 'package:store/data/mapper/pagination_mapper.dart';
import 'package:store/data/model/pagination_model.dart';
import 'package:store/domain/entity/get_category_products_request.dart';

class GetCategoryProductsRequestModel extends GetCategoryProductsRequest {
  GetCategoryProductsRequestModel({
    required int categoryId,
    required PaginationModel paginationModel,
  }) : super(categoryId: categoryId, pagination: paginationModel.toEntity);

  factory GetCategoryProductsRequestModel.fromJson(Map<String, dynamic> json) {
    return GetCategoryProductsRequestModel(
      categoryId: json['category_id'],
      paginationModel: PaginationModel.fromJson(json['pagination']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "category-id": categoryId,
      "pagination": pagination.toModel.toJson(),
    };
  }
}
