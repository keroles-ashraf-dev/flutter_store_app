import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/domain/usecase/cart/add_to_cart_usecase.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/app_constant.dart';
import '../../../core/util/enum.dart';
import '../../../domain/entity/add_to_cart_request.dart';
import '../../../domain/entity/product.dart';
import '../../../domain/entity/get_product_request.dart';
import '../../../domain/usecase/product/get_product_usecase.dart';
import '../../resource/function.dart';

part 'product_screen_event.dart';

part 'product_screen_state.dart';

class ProductScreenBloc extends Bloc<ProductScreenEvent, ProductScreenState> {
  final GetProductUsecase _getProductUsecase;
  final AddToCartUsecase _addToCartUsecase;

  ProductScreenBloc(this._getProductUsecase, this._addToCartUsecase) : super(const ProductScreenState()) {
    on<ProductScreenGetProductDataEvent>(_onGetProductEvent);
    on<ProductScreenAddToCartEvent>(_onAddToCartEvent);
  }

  Future<void> _onGetProductEvent(ProductScreenGetProductDataEvent event, Emitter<ProductScreenState> emit) async {
    final res = await _getProductUsecase(event.getProductRequest);

    await delayScreenChanging().then((_) => emit(_foldGetProductRes(res)));
  }

  ProductScreenState _foldGetProductRes(Either<Failure, Product> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
        productRequestState: RequestStateEnum.failure,
        getProductError: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        productRequestState: RequestStateEnum.success,
        product: r,
        getProductError: AppConstant.emptyStr,
      );
    });
  }

  Future<void> _onAddToCartEvent(ProductScreenAddToCartEvent event, Emitter<ProductScreenState> emit) async {
    emit(state.copyWith(addToCartRequestState: RequestStateEnum.loading));

    final res = await _addToCartUsecase(event.addToCartRequest);

    await delayScreenChanging().then((_) => emit(_foldAddToCartRes(res)));
  }

  ProductScreenState _foldAddToCartRes(Either<Failure, void> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
        addToCartRequestState: RequestStateEnum.failure,
        addToCartError: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        addToCartRequestState: RequestStateEnum.success,
        addToCartError: AppConstant.emptyStr,
      );
    });
  }
}
