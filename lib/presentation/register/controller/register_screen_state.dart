part of 'register_screen_bloc.dart';

class RegisterScreenState extends Equatable {
  final RegisterRequest registerRequest;
  final Map<String, String> validationErrors;
  final RequestStateEnum registerRequestState;
  final String serverError;

  const RegisterScreenState({
    this.registerRequest = const RegisterRequest.empty(),
    this.validationErrors = AppConstant.emptyStrMap,
    this.registerRequestState = RequestStateEnum.initializing,
    this.serverError = AppConstant.emptyStr,
  });

  RegisterScreenState copyWith({
    RegisterRequest? registerRequest,
    Map<String, String>? validationErrors,
    RequestStateEnum? registerRequestState,
    String? serverError,
  }) {
    return RegisterScreenState(
      registerRequest: registerRequest ?? this.registerRequest,
      validationErrors: validationErrors ?? this.validationErrors,
      registerRequestState: registerRequestState ?? this.registerRequestState,
      serverError: serverError ?? this.serverError,
    );
  }

  @override
  List<Object> get props => [
        registerRequest,
        validationErrors,
        registerRequestState,
        serverError,
      ];
}
