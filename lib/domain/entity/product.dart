import 'package:equatable/equatable.dart';

import '../../core/util/app_constant.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String description;
  final List<String> images;
  final double price;
  final double discountedPrice;
  final int availableCount;
  final double rating;
  final int ratersCount;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.discountedPrice,
    required this.availableCount,
    required this.rating,
    required this.ratersCount,
  });

  /// return empty object
  const Product.empty({
    this.id = AppConstant.emptyInt,
    this.name = AppConstant.emptyStr,
    this.description = AppConstant.emptyStr,
    this.images = AppConstant.emptyStrList,
    this.price = AppConstant.emptyDol,
    this.discountedPrice = AppConstant.emptyDol,
    this.availableCount = AppConstant.emptyInt,
    this.rating = AppConstant.emptyDol,
    this.ratersCount = AppConstant.emptyInt,
  });

  @override
  List<Object> get props => [
        id,
        name,
        description,
        images,
        price,
        discountedPrice,
        availableCount,
        rating,
        ratersCount,
      ];
}
