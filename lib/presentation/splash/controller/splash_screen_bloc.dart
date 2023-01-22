import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/error/error_handling.dart';
import 'package:store/domain/entity/user.dart';

import '../../../core/error/failure.dart';
import '../../../core/session/session.dart';
import '../../../core/util/app_constant.dart';
import '../../../core/util/enum.dart';
import '../../../domain/entity/no_param.dart';
import '../../../domain/usecase/user/get_user_data_usecase.dart';
import '../../resource/function.dart';

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

    await delayScreenChanging().then((value) async {
      emit(await _foldGetUserDataResponse(res));
    });
  }

  Future<SplashScreenState> _foldGetUserDataResponse(Either<Failure, User> either) async {
    return either.fold((l) async {
      /// first check if failure code is authorization code
      if (l.code == ErrorCode.unauthorizedCode || l.code == ErrorCode.badRequestCode) {
        return await _authorizationFailure();
      }

      /// return error state to show error message
      return state.copyWith(
          getUserDataRequestState: RequestStateEnum.failure,
          serverError: l.message);
    }, (r) async {
      /// share user object and return loaded state to go to main screen
      await _shareUserToSession(r);
      return state.copyWith(
          getUserDataRequestState: RequestStateEnum.success,
          serverError: AppConstant.emptyStr);
    });
  }

  Future<SplashScreenState> _authorizationFailure() async {
    /// remove token from prefs and destroy current session
    await _session.logout();

    return state.copyWith(
      getUserDataRequestState: RequestStateEnum.success,
      serverError: AppConstant.emptyStr,
    );
  }

  Future<void> _shareUserToSession(User user) async {
    /// share user object
    final success = await _session.start(user);
  }
}
