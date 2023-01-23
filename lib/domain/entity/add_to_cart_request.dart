import 'package:equatable/equatable.dart';

import '../../core/util/app_constant.dart';

class AddToCartRequest extends Equatable {
  final int userId;
  final int productId;

  const AddToCartRequest({
    required this.userId,
    required this.productId,
  });

  /// return empty object
  const AddToCartRequest.empty({
    this.userId = AppConstant.emptyInt,
    this.productId = AppConstant.emptyInt,
  });

  @override
  List<Object> get props => [
        userId,
        productId,
      ];
}
