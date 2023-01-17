import 'package:store/data/mapper/filter_mapper.dart';
import 'package:store/data/mapper/pagination_mapper.dart';
import 'package:store/data/model/filter_model.dart';
import 'package:store/data/model/pagination_model.dart';
import 'package:store/domain/entity/get_category_products_request.dart';

class GetCategoryProductsRequestModel extends GetCategoryProductsRequest {
  const GetCategoryProductsRequestModel({
    required super.categoryId,
    required super.pagination,
    required super.filter,
  });

  factory GetCategoryProductsRequestModel.fromJson(Map<String, dynamic> json) {
    return GetCategoryProductsRequestModel(
      categoryId: json['category_id'],
      pagination: PaginationModel.fromJson(json['pagination']),
      filter: FilterModel.fromJson(json['filter']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "category-id": categoryId,
      "pagination": pagination.toModel.toJson(),
      "filter": filter.toModel.toJson(),
    };
  }
}
