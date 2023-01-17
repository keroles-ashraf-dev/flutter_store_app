import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/util/size_manager.dart';
import 'package:store/core/util/ui_constant.dart';
import 'package:store/presentation/common/sub_appbar_widget.dart';
import 'package:store/presentation/theme/component/theme_screen_content_widget.dart';
import 'package:store/presentation/theme/controller/theme_screen_bloc.dart';

import '../../../core/service_locator/app_module.dart';
import '../../../core/util/app_restart.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThemeScreenBloc>(),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(AppSize.width, UIConstant.subAppbarHeight),
            child: SubAppbarWidget(title: AppString.theme.i18n()),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppSize.marginWidthExtraSmall,
            ),
            child: BlocListener<ThemeScreenBloc, ThemeScreenState>(
              listenWhen: (previous, current) {
                return current.apply;
              },
              listener: (context, state) {
                restartApp(context);
              },
              child: const ThemeScreenContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
