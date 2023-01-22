import 'package:dartz/dartz.dart';
import 'package:store/domain/entity/cart.dart';
import 'package:store/domain/repository/base_cart_repository.dart';

import '../../../core/error/failure.dart';
import '../../entity/decrease_cart_item_request.dart';
import '../base/base_usecase.dart';

class DecreaseCartItemUsecase extends BaseUsecase<Cart, DecreaseCartItemRequest> {
  final BaseCartRepository _cartRepository;

  DecreaseCartItemUsecase(this._cartRepository);

  @override
  Future<Either<Failure, Cart>> call(DecreaseCartItemRequest params) async {
    return await _cartRepository.decreaseCartItem(params);
  }
}
