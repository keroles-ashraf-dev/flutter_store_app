part of 'login_screen_bloc.dart';

class LoginScreenState extends Equatable {
  final LoginRequest loginRequest;
  final Map<String, String> validationErrors;
  final RequestStateEnum loginRequestState;
  final String serverError;

  const LoginScreenState({
    this.loginRequest = const LoginRequest.empty(),
    this.validationErrors = AppConstant.emptyStrMap,
    this.loginRequestState = RequestStateEnum.initializing,
    this.serverError = AppConstant.emptyStr,
  });

  LoginScreenState copyWith({
    LoginRequest? loginRequest,
    Map<String, String>? validationErrors,
    RequestStateEnum? loginRequestState,
    String? serverError,
  }) {
    return LoginScreenState(
      loginRequest: loginRequest ?? this.loginRequest,
      validationErrors: validationErrors ?? this.validationErrors,
      loginRequestState: loginRequestState ?? this.loginRequestState,
      serverError: serverError ?? this.serverError,
    );
  }

  @override
  List<Object> get props => [
        loginRequest,
        validationErrors,
        loginRequestState,
        serverError,
      ];
}
