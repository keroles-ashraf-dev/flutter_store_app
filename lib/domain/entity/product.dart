import 'package:equatable/equatable.dart';

import '../../core/util/app_constant.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String image;
  final double price;
  final double discountedPrice;
  final double rating;
  final int ratersCount;

  const Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.discountedPrice,
    required this.rating,
    required this.ratersCount,
  });

  /// return empty object
  const Product.empty({
    this.id = AppConstant.emptyInt,
    this.name = AppConstant.emptyStr,
    this.image = AppConstant.emptyStr,
    this.price = AppConstant.emptyDol,
    this.discountedPrice = AppConstant.emptyDol,
    this.rating = AppConstant.emptyDol,
    this.ratersCount = AppConstant.emptyInt,
  });

  @override
  List<Object> get props => [id, name, image];
}
