part of 'theme_screen_bloc.dart';

class ThemeScreenSelectedState extends Equatable {
   final ThemeEnum selectedTheme;

  const ThemeScreenSelectedState(this.selectedTheme);

  @override
  List<Object> get props => [selectedTheme];
}
