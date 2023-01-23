import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import 'package:store/domain/entity/product.dart';
import 'package:store/domain/entity/get_product_request.dart';
import 'package:store/domain/repository/base_product_repository.dart';

import '../base/base_usecase.dart';

class GetProductUsecase extends BaseUsecase<Product, GetProductRequest> {
  final BaseProductRepository _productRepository;

  GetProductUsecase(this._productRepository);

  @override
  Future<Either<Failure, Product>> call(GetProductRequest params) async {
    return await _productRepository.getProduct(params);
  }
}
