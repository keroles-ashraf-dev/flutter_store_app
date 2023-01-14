import 'package:equatable/equatable.dart';
import 'package:store/core/util/ui_constant.dart';
import 'package:store/domain/entity/pagination.dart';

import '../../core/util/app_constant.dart';

class GetCategoryProductsRequest extends Equatable {
  final int categoryId;
  final Pagination pagination;

  const GetCategoryProductsRequest({
    required this.categoryId,
    this.pagination = const Pagination(itemsCount: UIConstant.paginationItemsCountCount, offset: AppConstant.zeroInt),
  });

  /// return empty object
  const GetCategoryProductsRequest.empty({
    this.categoryId = AppConstant.emptyInt,
    this.pagination = const Pagination.empty(),
  });

  @override
  List<Object> get props => [categoryId, pagination];
}
