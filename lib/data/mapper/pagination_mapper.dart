import '../../domain/entity/pagination.dart';
import '../model/pagination_model.dart';

extension PaginationModelMapper on PaginationModel {
  Pagination get toEntity {
    return Pagination(
      itemsCount: itemsCount,
      offset: offset,
    );
  }
}

extension PaginationMapper on Pagination {
  PaginationModel get toModel {
    return PaginationModel(
      itemsCount: itemsCount,
      offset: offset,
    );
  }
}
