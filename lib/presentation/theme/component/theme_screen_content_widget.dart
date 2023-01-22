import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/presentation/theme/controller/theme_screen_bloc.dart';

import '../../../core/i18n/app_string.dart';
import '../../../core/theme/app_theme.dart';
import '../../resource/component/elevated_btn_widget.dart';
import 'theme_screen_themes_list_widget.dart';

class ThemeScreenContentWidget extends StatelessWidget {
  const ThemeScreenContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeScreenBloc, ThemeScreenState>(
      buildWhen: (previous, current) {
        return previous.selectedTheme != current.selectedTheme;
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ThemeScreenThemesListWidget(selectedTheme: state.selectedTheme),
            ElevatedBtnWidget(
              text: AppString.save.i18n(),
              action: () {
                _applyTheme(context, state.selectedTheme);
              },
            ),
          ],
        );
      },
    );
  }

  void _applyTheme(BuildContext context, ThemeEnum selectedTheme) {
    BlocProvider.of<ThemeScreenBloc>(context)
        .add(ThemeScreenApplyThemeEvent(selectedTheme));
  }
}
