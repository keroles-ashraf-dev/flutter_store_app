import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/util/app_prefs.dart';
import 'package:store/core/util/app_restart.dart';
import 'package:store/core/util/size_manager.dart';
import 'package:store/presentation/common/sub_appbar_widget.dart';
import 'package:store/presentation/language/component/languages_list_widget.dart';
import 'package:store/presentation/language/controller/language_screen_bloc.dart';

import '../../../core/util/app_module.dart';
import '../../common/elevated_btn_widget.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<LanguageScreenBloc>(),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(AppSize.width, AppSize.subAppbarHeight),
            child: SubAppbarWidget(title: AppString.language.i18n()),
          ),
          body: BlocBuilder<LanguageScreenBloc, LanguageScreenState>(
            buildWhen: (previous, current) {
              return previous.selectedLang != current.selectedLang;
            },
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppSize.marginWidthExtraSmall,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LanguagesListWidget(selectedLang: state.selectedLang),
                    ElevatedBtnWidget(
                      text: AppString.save.i18n(),
                      action: () {
                        _changeLanguage(context, state.selectedLang.name);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _changeLanguage(
      BuildContext context, String selectedLang) async {
    final bool success = await di<AppPrefs>().setAppLanguage(selectedLang);
    if (success) restartApp(context);
  }
}
