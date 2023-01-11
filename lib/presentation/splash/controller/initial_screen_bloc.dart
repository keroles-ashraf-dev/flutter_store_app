import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/error/failure.dart';
import 'package:store/core/util/app_constant.dart';
import 'package:store/core/util/app_prefs.dart';
import 'package:store/core/util/enum.dart';
import 'package:store/core/util/function.dart';
import 'package:store/domain/entity/user.dart';

import '../../../core/util/app_module.dart';
import '../../../domain/entity/no_param.dart';
import '../../../domain/usecase/user/get_user_data_usecase.dart';

part 'initial_screen_event.dart';

part 'initial_screen_state.dart';

class InitialScreenBloc extends Bloc<InitialScreenEvent, InitialScreenState> {
  final AppPrefs _appPrefs;
  final GetUserDataUsecase _getUserDataUseCase;

  InitialScreenBloc(this._appPrefs, this._getUserDataUseCase)
      : super(const InitialScreenState()) {
    on<InitialScreenGetUserDataEvent>(_onGetDataEvent);
  }

  Future<void> _onGetDataEvent(InitialScreenGetUserDataEvent event,
      Emitter<InitialScreenState> emit) async {
    /// first check user token in preferences
    /// if exist then get user data from server else return loaded state
    /// to go to main screen
    if (!_appPrefs.isLoggedIn) {
      _shareUserToDI(const User.empty());

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

  InitialScreenState _foldGetUserDataResponse(Either<Failure, User> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
          getUserDataRequestState: RequestStateEnum.failure,
          serverError: l.message);
    }, (r) {
      /// share user object and return loaded state to go to main screen
      _shareUserToDI(r);
      return state.copyWith(
          getUserDataRequestState: RequestStateEnum.success,
          serverError: AppConstant.emptyStr);
    });
  }

  void _shareUserToDI(User user) {
    if (AppModule.isRegistered<User>()) return;

    /// share user object
    di.registerSingleton<User>(user);
  }
}
