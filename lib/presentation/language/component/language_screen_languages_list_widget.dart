import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/presentation/language/controller/language_screen_bloc.dart';

import '../../../core/i18n/app_localization.dart';
import '../../resource/size_manager.dart';

class LanguageScreenLanguagesListWidget extends StatelessWidget {
  final LanguageEnum selectedLang;

  const LanguageScreenLanguagesListWidget(
      {Key? key, required this.selectedLang})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: LanguageEnum.values.length,
      itemBuilder: (context, i) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: AppSize.marginHeightTripleExtraSmall,
          ),
          child: ListTile(
            selected: LanguageEnum.values[i] == selectedLang,
            title: Text(LanguageEnum.values[i].name.i18n(),
                textAlign: TextAlign.center),
            onTap: () => _changeSelectedLang(context, LanguageEnum.values[i]),
          ),
        );
      },
    );
  }

  /// theme list tile on tap
  void _changeSelectedLang(BuildContext context, LanguageEnum lang) {
    BlocProvider.of<LanguageScreenBloc>(context)
        .add(LanguageScreenChangeLanguageEvent(lang));
  }
}
