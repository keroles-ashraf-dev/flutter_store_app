import '../../domain/entity/filter.dart';

class FilterModel extends Filter {
  const FilterModel({
    required super.sortBy,
    required super.orderBy,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      sortBy: json['sort_by'],
      orderBy: json['order_by'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "sort-by": sortBy.name,
      "order-by": orderBy.name,
    };
  }
}
