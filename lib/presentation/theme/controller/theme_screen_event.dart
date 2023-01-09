part of 'theme_screen_bloc.dart';

abstract class ThemeScreenEvent extends Equatable {
  const ThemeScreenEvent();

  @override
  List<Object> get props => [];
}

class ThemeScreenChangeEvent extends ThemeScreenEvent{
  final ThemeEnum selectedTheme;

  const ThemeScreenChangeEvent(this.selectedTheme);

  @override
  List<Object> get props => [selectedTheme];
}
