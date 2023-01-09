part of 'language_screen_bloc.dart';

abstract class LanguageScreenEvent extends Equatable {
  const LanguageScreenEvent();

  @override
  List<Object> get props => [];
}

class LanguageScreenChangeEvent extends LanguageScreenEvent{
  final LanguageEnum selectedLang;

  const LanguageScreenChangeEvent(this.selectedLang);

  @override
  List<Object> get props => [selectedLang];
}
