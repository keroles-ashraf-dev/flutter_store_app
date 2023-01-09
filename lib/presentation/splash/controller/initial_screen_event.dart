part of 'initial_screen_bloc.dart';

abstract class InitialScreenEvent extends Equatable {
  const InitialScreenEvent();

  @override
  List<Object?> get props => [];
}

class InitialScreenGetUserDataEvent extends InitialScreenEvent {
  const InitialScreenGetUserDataEvent();

  @override
  List<Object?> get props => [];
}
