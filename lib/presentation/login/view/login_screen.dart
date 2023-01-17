import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/presentation/login/component/login_screen_bloc_builder_widget.dart';
import 'package:store/presentation/login/controller/login_screen_bloc.dart';

import '../../../app/i18n/app_string.dart';
import '../../../app/service_locator/service_locator.dart';
import '../../../app/util/app_restart.dart';
import '../../../app/util/enum.dart';
import '../../common/sub_appbar_widget.dart';
import '../../resource/size_manager.dart';
import '../../resource/ui_constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginScreenBloc>(
      create: (context) => sl<LoginScreenBloc>(),
      child: BlocListener<LoginScreenBloc, LoginScreenState>(
        listener: (context, state) {
          if (state.loginRequestState == RequestStateEnum.success) {
            restartApp(context);
          }
        },
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size(AppSize.width, UIConstant.subAppbarHeight),
                child: SubAppbarWidget(title: AppString.login.i18n())),
            body: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                vertical: AppSize.marginHeightDoubleExtraSmall,
                horizontal: AppSize.marginWidthExtraSmall,
              ),
              child: const LoginScreenBlocBuilderWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
