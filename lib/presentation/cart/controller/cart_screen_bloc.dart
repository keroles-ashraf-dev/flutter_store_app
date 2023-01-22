import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/domain/entity/cart.dart';
import 'package:store/domain/entity/increase_cart_item_request.dart';
import 'package:store/domain/usecase/cart/increase_cart_item_usecase.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/app_constant.dart';
import '../../../core/util/enum.dart';
import '../../../domain/entity/decrease_cart_item_request.dart';
import '../../../domain/entity/get_cart_request.dart';
import '../../../domain/usecase/cart/decrease_cart_item_usecase.dart';
import '../../../domain/usecase/cart/get_cart_usecase.dart';
import '../../resource/function.dart';

part 'cart_screen_event.dart';

part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  final GetCartUsecase _cartUsecase;
  final IncreaseCartItemUsecase _increaseCartItemUsecase;
  final DecreaseCartItemUsecase _decreaseCartItemUsecase;

  CartScreenBloc(
    this._cartUsecase,
    this._increaseCartItemUsecase,
    this._decreaseCartItemUsecase,
  ) : super(const CartScreenState()) {
    on<CartScreenGetCartEvent>(_getCartEvent);
    on<CartScreenIncreaseCartItemEvent>(_increaseCartEvent);
    on<CartScreenDecreaseCartItemEvent>(_decreaseCartEvent);
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
        getCartError: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        cartRequestState: RequestStateEnum.success,
        cart: r,
        getCartError: AppConstant.emptyStr,
      );
    });
  }

  Future<void> _increaseCartEvent(CartScreenIncreaseCartItemEvent event, Emitter<CartScreenState> emit) async {
    emit(state.copyWith(cartUpdatingRequestState: RequestStateEnum.loading));

    final res = await _increaseCartItemUsecase(event.request);

    await delayScreenChanging().then((_) => emit(_foldCartUpdatingRes(res)));
  }

  Future<void> _decreaseCartEvent(CartScreenDecreaseCartItemEvent event, Emitter<CartScreenState> emit) async {
    emit(state.copyWith(cartUpdatingRequestState: RequestStateEnum.loading));

    final res = await _decreaseCartItemUsecase(event.request);

    await delayScreenChanging().then((_) => emit(_foldCartUpdatingRes(res)));
  }

  CartScreenState _foldCartUpdatingRes(Either<Failure, Cart> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
        cartUpdatingRequestState: RequestStateEnum.failure,
        updatingCartError: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        cartUpdatingRequestState: RequestStateEnum.success,
        cart: r,
        updatingCartError: AppConstant.emptyStr,
      );
    });
  }
}
