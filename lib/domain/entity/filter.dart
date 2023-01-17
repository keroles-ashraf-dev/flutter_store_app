import 'package:equatable/equatable.dart';

import '../../app/util/enum.dart';

class Filter extends Equatable {
  final FilterSortByEnum sortBy;
  final FilterOrderByEnum orderBy;

  const Filter({
    required this.sortBy,
    required this.orderBy,
  });

  /// return initial object
  const Filter.initial({
    this.sortBy = FilterSortByEnum.name,
    this.orderBy = FilterOrderByEnum.asc,
  });

  @override
  List<Object> get props => [
        sortBy,
        orderBy,
      ];
}
