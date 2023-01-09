part of 'main_screen_bloc.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();

  @override
  List<Object> get props => [];
}

class MainScreenInitialState extends MainScreenState {
  final int screenIndex;

  const MainScreenInitialState(
      {this.screenIndex = UIConstant.mainScreenBottomNavBarDefaultIndex});

  @override
  List<Object> get props => [screenIndex];
}

class MainScreenBottomNavBarState extends MainScreenState {
  final int screenIndex;

  const MainScreenBottomNavBarState(this.screenIndex);

  @override
  List<Object> get props => [screenIndex];
}
