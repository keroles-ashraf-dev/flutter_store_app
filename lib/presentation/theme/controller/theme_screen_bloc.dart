import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theme/app_theme.dart';

part 'theme_screen_event.dart';

part 'theme_screen_state.dart';

class ThemeScreenBloc extends Bloc<ThemeScreenEvent, ThemeScreenSelectedState> {
  ThemeScreenBloc() : super(ThemeScreenSelectedState(AppTheme.currentTheme)) {
    on<ThemeScreenChangeEvent>(_themeChange);
  }

  void _themeChange(
      ThemeScreenChangeEvent event, Emitter<ThemeScreenSelectedState> emit) {
    emit(ThemeScreenSelectedState(event.selectedTheme));
  }
}
