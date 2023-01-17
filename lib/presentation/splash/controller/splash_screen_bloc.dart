import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/error/failure.dart';
import 'package:store/core/session/session.dart';
import 'package:store/core/util/app_constant.dart';
import 'package:store/core/util/enum.dart';
import 'package:store/core/util/function.dart';
import 'package:store/domain/entity/user.dart';

import '../../../domain/entity/no_param.dart';
import '../../../domain/usecase/user/get_user_data_usecase.dart';

part 'splash_screen_event.dart';

part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final Session _session;
  final GetUserDataUsecase _getUserDataUseCase;

  SplashScreenBloc(this._session, this._getUserDataUseCase)
      : super(const SplashScreenState()) {
    on<SplashScreenGetUserDataEvent>(_onGetDataEvent);
  }

  Future<void> _onGetDataEvent(SplashScreenGetUserDataEvent event,
      Emitter<SplashScreenState> emit) async {
    /// first check user token in preferences
    /// if exist then get user data from server else return loaded state
    /// to go to main screen
    if (!_session.isLoggedIn) {
      await delayScreenChanging().then((value) {
        emit(state.copyWith(getUserDataRequestState: RequestStateEnum.success));
      });
      return;
    }

    final res = await _getUserDataUseCase(const NoParams());

    await delayScreenChanging().then((value) {
      _foldGetUserDataResponse(res);
    });
  }

  SplashScreenState _foldGetUserDataResponse(Either<Failure, User> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
          getUserDataRequestState: RequestStateEnum.failure,
          serverError: l.message);
    }, (r) {
      /// share user object and return loaded state to go to main screen
      _shareUserToSession(r);
      return state.copyWith(
          getUserDataRequestState: RequestStateEnum.success,
          serverError: AppConstant.emptyStr);
    });
  }

  void _shareUserToSession(User user) {
    /// share user object
    _session.start(user);
  }
}
