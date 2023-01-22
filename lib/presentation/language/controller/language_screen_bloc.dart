import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/i18n/app_localization.dart';
import '../../../core/util/app_prefs.dart';

part 'language_screen_event.dart';

part 'language_screen_state.dart';

class LanguageScreenBloc
    extends Bloc<LanguageScreenEvent, LanguageScreenState> {
  final AppPrefs _appPrefs;

  LanguageScreenBloc(this._appPrefs)
      : super(LanguageScreenState(selectedLang: AppLocalization.currentLanguage)) {
    on<LanguageScreenChangeLanguageEvent>(_languageChangeEvent);
    on<LanguageScreenApplyLanguageEvent>(_languageApplyEvent);
  }

  void _languageChangeEvent(LanguageScreenChangeLanguageEvent event, Emitter<LanguageScreenState> emit) {
    emit(LanguageScreenState(selectedLang: event.selectedLang, apply: false));
  }

  Future<void> _languageApplyEvent(LanguageScreenApplyLanguageEvent event, Emitter<LanguageScreenState> emit) async {
    final bool success = await _appPrefs.setAppLanguage(event.selectedLang.name);

    if (success) {
      emit(LanguageScreenState(selectedLang: event.selectedLang, apply: true));
    }
  }
}
