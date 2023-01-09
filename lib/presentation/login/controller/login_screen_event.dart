part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent extends Equatable {
  const LoginScreenEvent();
}

class LoginScreenLoginEvent extends LoginScreenEvent {
  final LoginRequest loginRequest;

  const LoginScreenLoginEvent(this.loginRequest);

  @override
  List<Object> get props => [loginRequest];
}
