import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/i18n/app_localization.dart';

part 'language_screen_event.dart';

part 'language_screen_state.dart';

class LanguageScreenBloc extends Bloc<LanguageScreenEvent, LanguageScreenState> {
  LanguageScreenBloc() : super(LanguageScreenState(AppLocalization.currentLanguage)) {
    on<LanguageScreenChangeEvent>(_languageChange);
  }

  void _languageChange(LanguageScreenChangeEvent event, Emitter<LanguageScreenState> emit) {
    emit(LanguageScreenState(event.selectedLang));
  }
}
