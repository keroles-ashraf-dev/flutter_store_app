import 'package:equatable/equatable.dart';
import 'package:store/domain/entity/pagination.dart';

import '../../core/util/app_constant.dart';
import 'filter.dart';

class GetCategoryProductsRequest extends Equatable {
  final int categoryId;
  final Pagination pagination;
  final Filter filter;

  const GetCategoryProductsRequest({
    required this.categoryId,
    this.pagination = const Pagination.initial(),
    this.filter = const Filter.initial(),
  });

  /// return empty object
  const GetCategoryProductsRequest.initial({
    this.categoryId = AppConstant.emptyInt,
    this.pagination = const Pagination.initial(),
    this.filter = const Filter.initial(),
  });

  @override
  List<Object> get props => [categoryId, pagination];
}
