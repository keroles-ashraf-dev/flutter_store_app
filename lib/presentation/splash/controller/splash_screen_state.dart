part of 'splash_screen_bloc.dart';

class SplashScreenState extends Equatable {
  final RequestStateEnum getUserDataRequestState;
  final String serverError;

  const SplashScreenState({
    this.getUserDataRequestState = RequestStateEnum.loading,
    this.serverError = AppConstant.emptyStr,
  });

  SplashScreenState copyWith({
    RequestStateEnum? getUserDataRequestState,
    String? serverError,
  }) {
    return SplashScreenState(
      getUserDataRequestState:
          getUserDataRequestState ?? this.getUserDataRequestState,
      serverError: serverError ?? this.serverError,
    );
  }

  @override
  List<Object> get props => [getUserDataRequestState, serverError];
}
