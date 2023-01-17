import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/util/app_constant.dart';
import 'package:store/core/util/enum.dart';
import 'package:store/domain/entity/cart.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/function.dart';
import '../../../domain/entity/get_cart_request.dart';
import '../../../domain/usecase/cart/get_cart_usecase.dart';

part 'cart_screen_event.dart';

part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  final GetCartUsecase _cartUsecase;

  CartScreenBloc(this._cartUsecase) : super(const CartScreenState()) {
    on<CartScreenGetCartEvent>(_getCartEvent);
  }

  Future<void> _getCartEvent(CartScreenGetCartEvent event, Emitter<CartScreenState> emit) async {
    final res = await _cartUsecase(event.request);

    await delayScreenChanging().then((_) => emit(_foldGetCartRes(res)));
  }

  CartScreenState _foldGetCartRes(Either<Failure, Cart> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
        cartRequestState: RequestStateEnum.failure,
        error: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        cartRequestState: RequestStateEnum.success,
        cart: r,
        error: AppConstant.emptyStr,
      );
    });
  }
}
