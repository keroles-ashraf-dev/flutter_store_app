import 'package:dartz/dartz.dart';
import 'package:store/domain/entity/cart.dart';
import 'package:store/domain/entity/get_cart_request.dart';

import '../../core/error/failure.dart';

abstract class BaseCartRepository {
  Future<Either<Failure, Cart>> getCart(GetCartRequest request);
}
