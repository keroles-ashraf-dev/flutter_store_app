import 'package:store/domain/entity/pagination.dart';

class PaginationModel extends Pagination {
  const PaginationModel({
    required super.itemsCount,
    required super.offset,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      itemsCount: json['items_count'],
      offset: json['offset'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "items-count": itemsCount,
      "offset": offset,
    };
  }
}
