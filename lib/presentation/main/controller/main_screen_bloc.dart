import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/util/app_constant.dart';
import 'package:store/core/util/enum.dart';
import 'package:store/domain/entity/address.dart';
import 'package:store/domain/entity/get_address_request.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/function.dart';
import '../../../core/util/ui_constant.dart';
import '../../../domain/usecase/address/get_address_usecase.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final GetAddressUsecase _getAddressUsecase;

  MainScreenBloc(this._getAddressUsecase) : super(const MainScreenState()) {
    on<MainScreenBottomNavBarChangeEvent>(_changeMainScreenBottomNavBar);
    on<MainScreenGetDefaultAddressEvent>(_getDefaultAddress);
  }

  void _changeMainScreenBottomNavBar(MainScreenBottomNavBarChangeEvent event, Emitter<MainScreenState> emit) {
    emit(state.copyWith(screenIndex: event.screenIndex));
  }

  Future<void> _getDefaultAddress(MainScreenGetDefaultAddressEvent event, Emitter<MainScreenState> emit) async {
    final res = await _getAddressUsecase(event.getAddressRequest);

    await delayScreenChanging().then((_) => emit(_foldGetAddressRes(res)));
  }

  MainScreenState _foldGetAddressRes(Either<Failure, Address> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
        addressRequestState: RequestStateEnum.failure,
        addressError: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        addressRequestState: RequestStateEnum.success,
        address: r,
        addressError: AppConstant.emptyStr,
      );
    });
  }
}
