import 'package:dartz/dartz.dart';
import 'package:store/domain/entity/add_to_cart_request.dart';
import 'package:store/domain/entity/cart.dart';
import 'package:store/domain/entity/get_cart_request.dart';
import 'package:store/domain/entity/increase_cart_item_request.dart';

import '../../core/error/failure.dart';
import '../entity/decrease_cart_item_request.dart';

abstract class BaseCartRepository {
  Future<Either<Failure, void>> addToCart(AddToCartRequest request);

  Future<Either<Failure, Cart>> getCart(GetCartRequest request);

  Future<Either<Failure, Cart>> increaseCartItem(IncreaseCartItemRequest request);

  Future<Either<Failure, Cart>> decreaseCartItem(DecreaseCartItemRequest request);
}
