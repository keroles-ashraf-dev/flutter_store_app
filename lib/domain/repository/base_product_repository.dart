import 'package:dartz/dartz.dart';
import 'package:store/domain/entity/get_category_products_request.dart';
import 'package:store/domain/entity/product.dart';

import '../../core/error/failure.dart';
import '../entity/get_product_request.dart';

abstract class BaseProductRepository {
  Future<Either<Failure, List<Product>>> getCategoryProducts(GetCategoryProductsRequest request);

  Future<Either<Failure, Product>> getProduct(GetProductRequest request);
}
