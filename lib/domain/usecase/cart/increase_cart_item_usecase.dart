import 'package:dartz/dartz.dart';
import 'package:store/domain/entity/cart.dart';
import 'package:store/domain/entity/increase_cart_item_request.dart';
import 'package:store/domain/repository/base_cart_repository.dart';

import '../../../core/error/failure.dart';
import '../base/base_usecase.dart';

class IncreaseCartItemUsecase extends BaseUsecase<Cart, IncreaseCartItemRequest> {
  final BaseCartRepository _cartRepository;

  IncreaseCartItemUsecase(this._cartRepository);

  @override
  Future<Either<Failure, Cart>> call(IncreaseCartItemRequest params) async {
    return await _cartRepository.increaseCartItem(params);
  }
}
