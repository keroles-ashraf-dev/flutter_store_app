import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import 'package:store/domain/entity/get_category_products_request.dart';
import 'package:store/domain/entity/product.dart';

import '../../repository/base_product_repository.dart';
import '../base/base_usecase.dart';

class GetCategoryProductsUsecase extends BaseUsecase<List<Product>, GetCategoryProductsRequest> {
  final BaseProductRepository _productRepository;

  GetCategoryProductsUsecase(this._productRepository);

  @override
  Future<Either<Failure, List<Product>>> call(GetCategoryProductsRequest params) async {
    return await _productRepository.getCategoryProducts(params);
  }
}
