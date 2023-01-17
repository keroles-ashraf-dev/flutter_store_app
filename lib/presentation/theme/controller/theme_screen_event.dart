part of 'theme_screen_bloc.dart';

abstract class ThemeScreenEvent extends Equatable {
  const ThemeScreenEvent();

  @override
  List<Object> get props => [];
}

class ThemeScreenChangeThemeEvent extends ThemeScreenEvent{
  final ThemeEnum selectedTheme;

  const ThemeScreenChangeThemeEvent(this.selectedTheme);

  @override
  List<Object> get props => [selectedTheme];
}

class ThemeScreenApplyThemeEvent extends ThemeScreenEvent{
  final ThemeEnum selectedTheme;

  const ThemeScreenApplyThemeEvent(this.selectedTheme);

  @override
  List<Object> get props => [selectedTheme];
}
