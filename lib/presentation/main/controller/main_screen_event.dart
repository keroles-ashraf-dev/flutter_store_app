part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();

  @override
  List<Object> get props => [];
}

class MainScreenGetDefaultAddressEvent extends MainScreenEvent {
  final GetAddressRequest getAddressRequest;

  const MainScreenGetDefaultAddressEvent(this.getAddressRequest);

  @override
  List<Object> get props => [getAddressRequest];
}

class MainScreenBottomNavBarChangeEvent extends MainScreenEvent {
  final int screenIndex;

  const MainScreenBottomNavBarChangeEvent(this.screenIndex);

  @override
  List<Object> get props => [screenIndex];
}
