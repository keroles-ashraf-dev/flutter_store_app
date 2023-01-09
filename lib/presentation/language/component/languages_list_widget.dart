import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_localization.dart';
import 'package:store/core/util/size_manager.dart';
import 'package:store/presentation/language/controller/language_screen_bloc.dart';

class LanguagesListWidget extends StatelessWidget {
  final LanguageEnum selectedLang;

  const LanguagesListWidget({Key? key, required this.selectedLang})
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
    BlocProvider.of<LanguageScreenBloc>(context).add(LanguageScreenChangeEvent(lang));
  }
}
