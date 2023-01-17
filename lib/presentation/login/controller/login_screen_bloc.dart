import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/core/session/session.dart';
import 'package:store/core/util/app_constant.dart';
import 'package:store/core/util/enum.dart';
import 'package:store/domain/entity/login_request.dart';
import 'package:store/domain/usecase/auth/login_usecase.dart';

import '../../../core/error/failure.dart';
import '../../../core/i18n/app_string.dart';
import '../../../core/util/validator.dart';
import '../../../domain/entity/user.dart';

part 'login_screen_event.dart';

part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final Session _session;
  final Validator _validator;
  final LoginUsecase _loginUsecase;

  LoginScreenBloc(this._session, this._validator, this._loginUsecase)
      : super(const LoginScreenState()) {
    on<LoginScreenLoginEvent>(_onLoginEvent);
  }

  Future<void> _onLoginEvent(
      LoginScreenLoginEvent event, Emitter<LoginScreenState> emit) async {
    emit(state.copyWith(
        loginRequestState: RequestStateEnum.loading,
        loginRequest: event.loginRequest));

    /// check login data validation
    final Map<String, String> errors = _isLoginInputsValid(event.loginRequest);

    if (errors.isNotEmpty) {
      emit(state.copyWith(
        loginRequestState: RequestStateEnum.initializing,
        validationErrors: errors,
        serverError: AppConstant.emptyStr,
      ));
      return;
    }

    final res = await _loginUsecase(event.loginRequest);

    emit(_foldLoginResponse(res));
  }

  LoginScreenState _foldLoginResponse(Either<Failure, User> either) {
    return either.fold((l) {
      /// return last state with error to show error message
      return state.copyWith(
          loginRequestState: RequestStateEnum.failure,
          validationErrors: AppConstant.emptyStrMap,
          serverError: l.message);
    }, (r) {
      /// share user object, update token and return loaded state to go to main screen
      _session.login(r);
      return state.copyWith(
        loginRequestState: RequestStateEnum.success,
        validationErrors: AppConstant.emptyStrMap,
        serverError: AppConstant.emptyStr,
      );
    });
  }

  Map<String, String> _isLoginInputsValid(LoginRequest loginRequest) {
    final Map<String, String> errors = {};

    if (!_validator.email(loginRequest.email)) {
      errors[AppString.email] = AppString.invalidEmail.i18n();
    }
    if (!_validator.length(loginRequest.password)) {
      errors[AppString.password] = AppString.invalidPassword.i18n();
    }
    return errors;
  }
}
