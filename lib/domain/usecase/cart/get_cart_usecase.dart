import 'package:dartz/dartz.dart';
import 'package:store/core/error/failure.dart';
import 'package:store/domain/entity/cart.dart';
import 'package:store/domain/entity/get_cart_request.dart';
import 'package:store/domain/repository/base_cart_repository.dart';

import '../base/base_usecase.dart';

class GetCartUsecase extends BaseUsecase<Cart, GetCartRequest> {
  final BaseCartRepository _cartRepository;

  GetCartUsecase(this._cartRepository);

  @override
  Future<Either<Failure, Cart>> call(GetCartRequest params) async {
    return await _cartRepository.getCart(params);
  }
}
