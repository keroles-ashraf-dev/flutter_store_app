import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/error/failure.dart';
import '../../../app/navigation/routes.dart';
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
  final mainScreenNavigatorKey = GlobalKey<NavigatorState>();

  MainScreenBloc(this._getAddressUsecase) : super(const MainScreenState()) {
    on<MainScreenBottomNavBarChangeEvent>(_changeMainScreenBottomNavBar);
    on<MainScreenGetDefaultAddressEvent>(_getDefaultAddress);
  }

  void _changeMainScreenBottomNavBar(MainScreenBottomNavBarChangeEvent event, Emitter<MainScreenState> emit) {
    _changeMainScreenBody(event.screenIndex);
    emit(state.copyWith(screenIndex: event.screenIndex));
  }

  void _changeMainScreenBody(int i) {
    switch (i) {
      case UIConstant.mainScreenHomeScreenIndex:
        mainScreenNavigatorKey.currentState?.pushReplacementNamed(Routes.routeHome);
        break;
      case UIConstant.mainScreenAccountScreenIndex:
        mainScreenNavigatorKey.currentState?.pushReplacementNamed(Routes.routeAccount);
        break;
      case UIConstant.mainScreenCartScreenIndex:
        mainScreenNavigatorKey.currentState?.pushReplacementNamed(Routes.routeCart);
        break;
      case UIConstant.mainScreenMoreScreenIndex:
        mainScreenNavigatorKey.currentState?.pushReplacementNamed(Routes.routeMore);
        break;
      default:
        mainScreenNavigatorKey.currentState?.pushReplacementNamed(Routes.routeHome);
        break;
    }
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
