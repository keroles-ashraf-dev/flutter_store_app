import 'package:equatable/equatable.dart';

import '../../core/util/app_constant.dart';

class CartItem extends Equatable {
  final int productId;
  final String name;
  final double price;
  final double discountedPrice;
  final int availableCount;
  final int count;
  final List<String> images;

  const CartItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.discountedPrice,
    required this.availableCount,
    required this.count,
    required this.images,
  });

  /// return empty object
  const CartItem.empty({
    this.productId = AppConstant.emptyInt,
    this.name = AppConstant.emptyStr,
    this.price = AppConstant.emptyDol,
    this.discountedPrice = AppConstant.emptyDol,
    this.availableCount = AppConstant.emptyInt,
    this.count = AppConstant.emptyInt,
    this.images = AppConstant.emptyStrList,
  });

  @override
  List<Object> get props => [
        productId,
        name,
        price,
        discountedPrice,
        availableCount,
        count,
        images,
      ];
}
