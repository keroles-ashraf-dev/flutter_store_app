import 'package:dartz/dartz.dart';
import 'package:store/domain/entity/get_category_products_request.dart';
import 'package:store/domain/entity/product.dart';

import '../../app/error/failure.dart';

abstract class BaseProductRepository {
  Future<Either<Failure, List<Product>>> getCategoryProducts(
      GetCategoryProductsRequest request);
}
