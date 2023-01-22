import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/util/app_prefs.dart';

part 'theme_screen_event.dart';

part 'theme_screen_state.dart';

class ThemeScreenBloc extends Bloc<ThemeScreenEvent, ThemeScreenState> {
  final AppPrefs _appPrefs;

  ThemeScreenBloc(this._appPrefs)
      : super(ThemeScreenState(selectedTheme: AppTheme.currentTheme)) {
    on<ThemeScreenChangeThemeEvent>(_themeChangeEvent);
    on<ThemeScreenApplyThemeEvent>(_themeApplyEvent);
  }

  void _themeChangeEvent(
      ThemeScreenChangeThemeEvent event, Emitter<ThemeScreenState> emit) {
    emit(ThemeScreenState(selectedTheme: event.selectedTheme, apply: false));
  }

  Future<void> _themeApplyEvent(
      ThemeScreenApplyThemeEvent event, Emitter<ThemeScreenState> emit) async {
    final bool success = await _appPrefs.setAppTheme(event.selectedTheme.name);
    if (success)
      emit(ThemeScreenState(selectedTheme: event.selectedTheme, apply: true));
  }
}
