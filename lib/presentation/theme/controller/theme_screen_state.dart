part of 'theme_screen_bloc.dart';

class ThemeScreenState extends Equatable {
  final ThemeEnum selectedTheme;
  final bool apply;

  const ThemeScreenState({required this.selectedTheme, this.apply = false});

  @override
  List<Object> get props => [selectedTheme, apply];
}
