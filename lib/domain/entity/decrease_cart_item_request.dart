import 'package:equatable/equatable.dart';

import '../../core/util/app_constant.dart';

class DecreaseCartItemRequest extends Equatable {
  final int userId;
  final int productId;

  const DecreaseCartItemRequest({
    required this.userId,
    required this.productId,
  });

  /// return empty object
  const DecreaseCartItemRequest.empty({
    this.userId = AppConstant.emptyInt,
    this.productId = AppConstant.emptyInt,
  });

  @override
  List<Object> get props => [userId, productId];
}
