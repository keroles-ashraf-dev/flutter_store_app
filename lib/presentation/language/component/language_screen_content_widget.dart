import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/presentation/language/component/language_screen_languages_list_widget.dart';

import '../../../app/i18n/app_localization.dart';
import '../../../app/i18n/app_string.dart';
import '../../common/elevated_btn_widget.dart';
import '../controller/language_screen_bloc.dart';

class LanguageScreenContentWidget extends StatelessWidget {
  const LanguageScreenContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageScreenBloc, LanguageScreenState>(
      buildWhen: (previous, current) {
        return previous.selectedLang != current.selectedLang;
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LanguageScreenLanguagesListWidget(selectedLang: state.selectedLang),
            ElevatedBtnWidget(
              text: AppString.save.i18n(),
              action: () {
                _applyLanguage(context, state.selectedLang);
              },
            ),
          ],
        );
      },
    );
  }

  void _applyLanguage(BuildContext context, LanguageEnum lang) {
    BlocProvider.of<LanguageScreenBloc>(context)
        .add(LanguageScreenApplyLanguageEvent(lang));
  }
}
