import 'package:dartz/dartz.dart';
import 'package:store/domain/entity/add_to_cart_request.dart';
import 'package:store/domain/repository/base_cart_repository.dart';

import '../../../core/error/failure.dart';
import '../base/base_usecase.dart';

class AddToCartUsecase extends BaseUsecase<void, AddToCartRequest> {
  final BaseCartRepository _cartRepository;

  AddToCartUsecase(this._cartRepository);

  @override
  Future<Either<Failure, void>> call(AddToCartRequest params) async {
    return await _cartRepository.addToCart(params);
  }
}
