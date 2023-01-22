import 'package:equatable/equatable.dart';

import '../../core/util/app_constant.dart';

class IncreaseCartItemRequest extends Equatable {
  final int userId;
  final int productId;

  const IncreaseCartItemRequest({
    required this.userId,
    required this.productId,
  });

  /// return empty object
  const IncreaseCartItemRequest.empty({
    this.userId = AppConstant.emptyInt,
    this.productId = AppConstant.emptyInt,
  });

  @override
  List<Object> get props => [userId, productId];
}
