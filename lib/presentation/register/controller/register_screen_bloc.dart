import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/domain/entity/register_request.dart';
import 'package:store/domain/usecase/auth/register_usecase.dart';

import '../../../app/error/failure.dart';
import '../../../app/i18n/app_string.dart';
import '../../../app/session/session.dart';
import '../../../app/util/app_constant.dart';
import '../../../app/util/enum.dart';
import '../../../app/validation/validator.dart';
import '../../../domain/entity/user.dart';
import '../../resource/function.dart';

part 'register_screen_event.dart';

part 'register_screen_state.dart';

class RegisterScreenBloc extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  final Session _session;
  final Validator _validator;
  final RegisterUsecase _registerUsecase;

  RegisterScreenBloc(
    this._session,
    this._validator,
    this._registerUsecase,
  ) : super(const RegisterScreenState()) {
    on<RegisterScreenRegisterEvent>(_onRegisterEvent);
  }

  Future<void> _onRegisterEvent(RegisterScreenRegisterEvent event,
      Emitter<RegisterScreenState> emit) async {
    emit(state.copyWith(
      registerRequestState: RequestStateEnum.loading,
      registerRequest: event.registerRequest,
    ));

    /// check register data validation
    final Map<String, String> errors = _isRegisterInputsValid(event.registerRequest);

    if (errors.isNotEmpty) {
      emit(state.copyWith(
        registerRequestState: RequestStateEnum.initializing,
        validationErrors: errors,
        serverError: AppConstant.emptyStr,
      ));
      return;
    }

    final res = await _registerUsecase(event.registerRequest);

    await delayScreenChanging().then((_) => emit(_foldRegisterResponse(res)));
  }

  RegisterScreenState _foldRegisterResponse(Either<Failure, User> either) {
    return either.fold((l) {
      /// return last state with error to show error message
      return state.copyWith(
          registerRequestState: RequestStateEnum.failure,
          validationErrors: AppConstant.emptyStrMap,
          serverError: l.message);
    }, (r) {
      /// set token, user and return loaded state to go to home screen
      _session.login(r);
      return state.copyWith(
        registerRequestState: RequestStateEnum.success,
        validationErrors: AppConstant.emptyStrMap,
        serverError: AppConstant.emptyStr,
      );
    });
  }

  Map<String, String> _isRegisterInputsValid(RegisterRequest registerRequest) {
    final Map<String, String> errors = {};

    if (!_validator.name(registerRequest.firstName)) {
      errors[AppString.firstName] = AppString.invalidName.i18n();
    }
    if (!_validator.name(registerRequest.lastName)) {
      errors[AppString.lastName] = AppString.invalidName.i18n();
    }
    if (!_validator.email(registerRequest.email)) {
      errors[AppString.email] = AppString.invalidEmail.i18n();
    }
    if (!_validator.phone(registerRequest.phone)) {
      errors[AppString.phone] = AppString.invalidPhone.i18n();
    }
    if (!_validator.length(registerRequest.password)) {
      errors[AppString.password] = AppString.invalidPassword.i18n();
    }
    if (!_validator.match(registerRequest.password, registerRequest.confirmPassword)) {
      errors[AppString.confirmPassword] = AppString.invalidConfirmPassword.i18n();
    }
    return errors;
  }
}
