import 'package:store/data/model/product_model.dart';

import '../../domain/entity/product.dart';

extension ProductModelMapper on ProductModel {
  Product get toEntity {
    return Product(
      id: id,
      name: name,
      image: image,
      price: price,
      discountedPrice: discountedPrice,
      rating: rating,
      ratersCount: ratersCount,
    );
  }
}

extension ProductMapper on ProductModel {
  ProductModel get toModel {
    return ProductModel(
      id: id,
      name: name,
      image: image,
      price: price,
      discountedPrice: discountedPrice,
      rating: rating,
      ratersCount: ratersCount,
    );
  }
}
