part of 'language_screen_bloc.dart';

class LanguageScreenState extends Equatable {
  final LanguageEnum selectedLang;
  final bool apply;

  const LanguageScreenState({required this.selectedLang, this.apply = false});

  @override
  List<Object> get props => [selectedLang, apply];
}
