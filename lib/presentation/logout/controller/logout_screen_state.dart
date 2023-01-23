part of 'logout_screen_bloc.dart';

class LogoutScreenState extends Equatable {
  final bool loggedOut;

  const LogoutScreenState({this.loggedOut = false});

  LogoutScreenState copyWith({bool? loggedOut}) {
    return LogoutScreenState(loggedOut: loggedOut ?? this.loggedOut);
  }

  @override
  List<Object> get props => [loggedOut];
}
