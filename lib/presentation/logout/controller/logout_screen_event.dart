part of 'logout_screen_bloc.dart';

abstract class LogoutScreenEvent extends Equatable {
  const LogoutScreenEvent();
}

class LogoutScreenLogoutEvent extends LogoutScreenEvent {
  const LogoutScreenLogoutEvent();

  @override
  List<Object> get props => [];
}
