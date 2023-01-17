import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/presentation/common/sub_appbar_widget.dart';
import 'package:store/presentation/theme/component/theme_screen_content_widget.dart';
import 'package:store/presentation/theme/controller/theme_screen_bloc.dart';

import '../../../app/i18n/app_string.dart';
import '../../../app/service_locator/service_locator.dart';
import '../../../app/util/app_restart.dart';
import '../../resource/size_manager.dart';
import '../../resource/ui_constant.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeScreenBloc>(
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
