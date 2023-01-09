part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();

  @override
  List<Object> get props => [];
}

class MainScreenBottomNavBarChangeEvent extends MainScreenEvent {
  final int screenIndex;

  const MainScreenBottomNavBarChangeEvent(this.screenIndex);

  @override
  List<Object> get props => [screenIndex];
}
