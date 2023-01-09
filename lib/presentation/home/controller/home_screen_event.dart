part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

class HomeScreenGetMainCarouselEvent extends HomeScreenEvent {
  const HomeScreenGetMainCarouselEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenGetMainCategoriesEvent extends HomeScreenEvent {
  const HomeScreenGetMainCategoriesEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenGetDealsEvent extends HomeScreenEvent {
  const HomeScreenGetDealsEvent();

  @override
  List<Object> get props => [];
}
