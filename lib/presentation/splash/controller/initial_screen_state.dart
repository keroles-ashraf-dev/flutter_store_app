part of 'initial_screen_bloc.dart';

class InitialScreenState extends Equatable {
  final RequestStateEnum getUserDataRequestState;
  final String serverError;

  const InitialScreenState({
    this.getUserDataRequestState = RequestStateEnum.loading,
    this.serverError = AppConstant.emptyStr,
  });

  InitialScreenState copyWith({
    RequestStateEnum? getUserDataRequestState,
    String? serverError,
  }) {
    return InitialScreenState(
      getUserDataRequestState:
          getUserDataRequestState ?? this.getUserDataRequestState,
      serverError: serverError ?? this.serverError,
    );
  }

  @override
  List<Object> get props => [getUserDataRequestState, serverError];
}
