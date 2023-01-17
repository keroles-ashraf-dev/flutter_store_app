import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/util/size_manager.dart';
import 'package:store/presentation/common/sub_appbar_widget.dart';
import 'package:store/presentation/language/component/language_screen_content_widget.dart';
import 'package:store/presentation/language/controller/language_screen_bloc.dart';

import '../../../core/service_locator/app_module.dart';
import '../../../core/util/app_restart.dart';
import '../../../core/util/ui_constant.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LanguageScreenBloc>(),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(AppSize.width, UIConstant.subAppbarHeight),
            child: SubAppbarWidget(title: AppString.language.i18n()),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppSize.marginWidthExtraSmall,
            ),
            child: BlocListener<LanguageScreenBloc, LanguageScreenState>(
              listenWhen: (previous, current) {
                return current.apply;
              },
              listener: (context, state) {
                restartApp(context);
              },
              child: const LanguageScreenContentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
