part of 'language_screen_bloc.dart';

abstract class LanguageScreenEvent extends Equatable {
  const LanguageScreenEvent();

  @override
  List<Object> get props => [];
}

class LanguageScreenChangeLanguageEvent extends LanguageScreenEvent{
  final LanguageEnum selectedLang;

  const LanguageScreenChangeLanguageEvent(this.selectedLang);

  @override
  List<Object> get props => [selectedLang];
}

class LanguageScreenApplyLanguageEvent extends LanguageScreenEvent{
  final LanguageEnum selectedLang;

  const LanguageScreenApplyLanguageEvent(this.selectedLang);

  @override
  List<Object> get props => [selectedLang];
}
