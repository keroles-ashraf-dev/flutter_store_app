import 'package:equatable/equatable.dart';

import '../../core/util/app_constant.dart';

class Pagination extends Equatable {
  /// requested items count
  final int itemsCount;

  /// started position
  final int offset;

  const Pagination({
    required this.itemsCount,
    required this.offset,
  });

  /// return empty object
  const Pagination.empty({
    this.itemsCount = AppConstant.emptyInt,
    this.offset = AppConstant.emptyInt,
  });

  @override
  List<Object> get props => [
        itemsCount,
        offset,
      ];
}
