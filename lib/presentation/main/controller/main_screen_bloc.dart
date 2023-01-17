import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/error/failure.dart';
import '../../../app/util/app_constant.dart';
import '../../../app/util/enum.dart';
import '../../../domain/entity/address.dart';
import '../../../domain/entity/get_address_request.dart';
import '../../../domain/usecase/address/get_address_usecase.dart';
import '../../resource/function.dart';
import '../../resource/ui_constant.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final GetAddressUsecase _getAddressUsecase;

  MainScreenBloc(this._getAddressUsecase) : super(const MainScreenState()) {
    on<MainScreenBottomNavBarChangeEvent>(_changeMainScreenBottomNavBar);
    on<MainScreenGetDefaultAddressEvent>(_getDefaultAddress);
  }

  void _changeMainScreenBottomNavBar(
      MainScreenBottomNavBarChangeEvent event, Emitter<MainScreenState> emit) {
    emit(state.copyWith(screenIndex: event.screenIndex));
  }

  Future<void> _getDefaultAddress(MainScreenGetDefaultAddressEvent event,
      Emitter<MainScreenState> emit) async {
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
