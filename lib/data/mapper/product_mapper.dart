import 'package:store/data/mapper/filter_mapper.dart';
import 'package:store/data/mapper/pagination_mapper.dart';
import 'package:store/data/model/get_category_products_request_model.dart';
import 'package:store/data/model/product_model.dart';
import 'package:store/domain/entity/get_category_products_request.dart';

import '../../domain/entity/get_product_request.dart';
import '../../domain/entity/product.dart';
import '../model/get_product_request_model.dart';

extension ProductModelMapper on ProductModel {
  Product get toEntity {
    return Product(
      id: id,
      name: name,
      description: description,
      images: images,
      price: price,
      discountedPrice: discountedPrice,
      availableCount: availableCount,
      rating: rating,
      ratersCount: ratersCount,
    );
  }
}

extension ProductMapper on Product {
  ProductModel get toModel {
    return ProductModel(
      id: id,
      name: name,
      description: description,
      images: images,
      price: price,
      discountedPrice: discountedPrice,
      availableCount: availableCount,
      rating: rating,
      ratersCount: ratersCount,
    );
  }
}

extension GetProductRequestMapper on GetProductRequest {
  GetProductRequestModel get toModel {
    return GetProductRequestModel(
      id: id,
    );
  }
}

extension GetCategoryProductsRequestMapper on GetCategoryProductsRequest {
  GetCategoryProductsRequestModel get toModel {
    return GetCategoryProductsRequestModel(
      categoryId: categoryId,
      pagination: pagination.toModel,
      filter: filter.toModel,
    );
  }
}
