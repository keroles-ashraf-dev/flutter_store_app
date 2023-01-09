import 'package:dartz/dartz.dart';
import 'package:store/domain/entity/product.dart';

import '../../core/error/failure.dart';

abstract class BaseProductRepository {
  Future<Either<Failure, List<Product>>> getDeals();
}
