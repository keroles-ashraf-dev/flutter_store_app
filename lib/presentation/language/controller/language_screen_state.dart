part of 'language_screen_bloc.dart';

class LanguageScreenState extends Equatable {
  final LanguageEnum selectedLang;

  const LanguageScreenState(this.selectedLang);

  @override
  List<Object> get props => [selectedLang];
}
