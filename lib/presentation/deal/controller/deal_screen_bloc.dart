import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/error/failure.dart';
import '../../../app/util/app_constant.dart';
import '../../../app/util/enum.dart';
import '../../../domain/entity/deal.dart';
import '../../../domain/entity/get_deal_request.dart';
import '../../../domain/usecase/deal/get_deal_usecase.dart';
import '../../resource/function.dart';

part 'deal_screen_event.dart';

part 'deal_screen_state.dart';

class DealScreenBloc extends Bloc<DealScreenEvent, DealScreenState> {
  final GetDealUsecase _getDealUsecase;

  DealScreenBloc(this._getDealUsecase) : super(const DealScreenState()) {
    on<DealScreenGetDealDataEvent>(_onGetDealEvent);
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
        error: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        dealRequestState: RequestStateEnum.success,
        deal: r,
        error: AppConstant.emptyStr,
      );
    });
  }
}
