import 'package:equatable/equatable.dart';

import '../../core/util/app_constant.dart';
import '../../presentation/resource/ui_constant.dart';

class Pagination extends Equatable {
  final int itemsCount; // requested items count
  final int offset; // started position

  const Pagination({
    required this.itemsCount,
    required this.offset,
  });

  /// return empty object
  const Pagination.initial({
    this.itemsCount = UIConstant.paginationItemsCountCount,
    this.offset = AppConstant.zeroInt,
  });

  @override
  List<Object> get props => [
        itemsCount,
        offset,
      ];
}
