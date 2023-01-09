part of 'register_screen_bloc.dart';

abstract class RegisterScreenEvent extends Equatable {
  const RegisterScreenEvent();
}

class RegisterScreenRegisterEvent extends RegisterScreenEvent {
  final RegisterRequest registerRequest;

  const RegisterScreenRegisterEvent(this.registerRequest);

  @override
  List<Object> get props => [registerRequest];
}
