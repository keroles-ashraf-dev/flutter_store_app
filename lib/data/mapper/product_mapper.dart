import 'package:store/data/mapper/pagination_mapper.dart';
import 'package:store/data/model/get_category_products_request_model.dart';
import 'package:store/data/model/product_model.dart';
import 'package:store/domain/entity/get_category_products_request.dart';

import '../../domain/entity/product.dart';

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

extension ProductMapper on ProductModel {
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

extension GetCategoryProductsRequestMapper on GetCategoryProductsRequest {
  GetCategoryProductsRequestModel get toModel {
    return GetCategoryProductsRequestModel(
      categoryId: categoryId,
      paginationModel: pagination.toModel,
    );
  }
}
