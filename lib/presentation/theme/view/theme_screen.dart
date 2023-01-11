import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/util/app_prefs.dart';
import 'package:store/core/util/app_restart.dart';
import 'package:store/core/util/size_manager.dart';
import 'package:store/presentation/common/elevated_btn_widget.dart';
import 'package:store/presentation/common/sub_appbar_widget.dart';
import 'package:store/presentation/theme/controller/theme_screen_bloc.dart';

import '../../../core/util/app_module.dart';
import '../component/themes_list_widget.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ThemeScreenBloc>(),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(AppSize.width, AppSize.subAppbarHeight),
            child: SubAppbarWidget(title: AppString.theme.i18n()),
          ),
          body: BlocBuilder<ThemeScreenBloc, ThemeScreenSelectedState>(
            buildWhen: (previous, current) {
              return previous.selectedTheme != current.selectedTheme;
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
                    ThemesListWidget(selectedTheme: state.selectedTheme),
                    ElevatedBtnWidget(
                      text: AppString.save.i18n(),
                      action: () {
                        _changeTheme(context, state.selectedTheme.name);
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

  Future<void> _changeTheme(BuildContext context, String selectedTheme) async {
    final bool success = await di<AppPrefs>().setAppTheme(selectedTheme);
    if (success) restartApp(context);
  }
}
