import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/core/util/app_constant.dart';
import 'package:store/core/util/enum.dart';
import 'package:store/domain/entity/register_request.dart';
import 'package:store/domain/usecase/auth/register_usecase.dart';

import '../../../core/error/failure.dart';
import '../../../core/i18n/app_string.dart';
import '../../../core/util/app_module.dart';
import '../../../core/util/app_prefs.dart';
import '../../../core/util/validator.dart';
import '../../../domain/entity/user.dart';

part 'register_screen_event.dart';

part 'register_screen_state.dart';

class RegisterScreenBloc
    extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  final AppPrefs _appPrefs;
  final RegisterUsecase _registerUsecase;

  RegisterScreenBloc(this._appPrefs, this._registerUsecase)
      : super(const RegisterScreenState()) {
    on<RegisterScreenRegisterEvent>(_onRegisterEvent);
  }

  Future<void> _onRegisterEvent(RegisterScreenRegisterEvent event,
      Emitter<RegisterScreenState> emit) async {
    emit(state.copyWith(
        registerRequestState: RequestStateEnum.loading,
        registerRequest: event.registerRequest));

    /// check register data validation
    final Map<String, String> errors =
        _isRegisterInputsValid(event.registerRequest);

    if (errors.isNotEmpty) {
      emit(state.copyWith(
        registerRequestState: RequestStateEnum.initializing,
        validationErrors: errors,
        serverError: AppConstant.emptyStr,
      ));
      return;
    }

    final res = await _registerUsecase(event.registerRequest);

    emit(_foldRegisterResponse(res));
  }

  RegisterScreenState _foldRegisterResponse(Either<Failure, User> either) {
    return either.fold((l) {
      /// return last state with error to show error message
      return state.copyWith(
          registerRequestState: RequestStateEnum.failure,
          validationErrors: AppConstant.emptyStrMap,
          serverError: l.message);
    }, (r) {
      /// share user object, update token and return loaded state to go to main screen
      _updatePrefsAuthToken(r.authToken);
      return state.copyWith(
        registerRequestState: RequestStateEnum.success,
        validationErrors: AppConstant.emptyStrMap,
        serverError: AppConstant.emptyStr,
      );
    });
  }

  void _updatePrefsAuthToken(String token) {
    /// update prefs auth token
    _appPrefs.setAuthToken(token);
  }

  Map<String, String> _isRegisterInputsValid(RegisterRequest registerRequest) {
    final Map<String, String> errors = {};

    if (!di<Validator>().name(registerRequest.firstName)) {
      errors[AppString.firstName] = AppString.invalidName.i18n();
    }
    if (!di<Validator>().name(registerRequest.lastName)) {
      errors[AppString.lastName] = AppString.invalidName.i18n();
    }
    if (!di<Validator>().email(registerRequest.email)) {
      errors[AppString.email] = AppString.invalidEmail.i18n();
    }
    if (!di<Validator>().phone(registerRequest.phone)) {
      errors[AppString.phone] = AppString.invalidPhone.i18n();
    }
    if (!di<Validator>().length(registerRequest.password)) {
      errors[AppString.password] = AppString.invalidPassword.i18n();
    }
    if (!di<Validator>()
        .match(registerRequest.password, registerRequest.confirmPassword)) {
      errors[AppString.confirmPassword] =
          AppString.invalidConfirmPassword.i18n();
    }
    return errors;
  }
}
