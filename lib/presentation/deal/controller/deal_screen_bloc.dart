import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/app_constant.dart';
import '../../../core/util/enum.dart';
import '../../../domain/entity/add_to_cart_request.dart';
import '../../../domain/entity/deal.dart';
import '../../../domain/entity/get_deal_request.dart';
import '../../../domain/usecase/cart/add_to_cart_usecase.dart';
import '../../../domain/usecase/deal/get_deal_usecase.dart';
import '../../resource/function.dart';

part 'deal_screen_event.dart';

part 'deal_screen_state.dart';

class DealScreenBloc extends Bloc<DealScreenEvent, DealScreenState> {
  final GetDealUsecase _getDealUsecase;
  final AddToCartUsecase _addToCartUsecase;

  DealScreenBloc(this._getDealUsecase, this._addToCartUsecase) : super(const DealScreenState()) {
    on<DealScreenGetDealDataEvent>(_onGetDealEvent);
    on<DealScreenAddToCartEvent>(_onAddToCartEvent);
  }

  Future<void> _onGetDealEvent(
      DealScreenGetDealDataEvent event, Emitter<DealScreenState> emit) async {
    final res = await _getDealUsecase(event.getDealRequest);

    await delayScreenChanging().then((_) => emit(_foldGetCarouselRes(res)));
  }

  DealScreenState _foldGetCarouselRes(Either<Failure, Deal> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
        dealRequestState: RequestStateEnum.failure,
        getDealError: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        dealRequestState: RequestStateEnum.success,
        deal: r,
        getDealError: AppConstant.emptyStr,
      );
    });
  }

  Future<void> _onAddToCartEvent(DealScreenAddToCartEvent event, Emitter<DealScreenState> emit) async {
    emit(state.copyWith(addToCartRequestState: RequestStateEnum.loading));

    final res = await _addToCartUsecase(event.addToCartRequest);

    await delayScreenChanging().then((_) => emit(_foldAddToCartRes(res)));
  }

  DealScreenState _foldAddToCartRes(Either<Failure, void> either) {
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
