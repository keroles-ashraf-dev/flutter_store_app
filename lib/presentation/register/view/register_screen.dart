import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/util/enum.dart';
import 'package:store/core/util/size_manager.dart';
import 'package:store/presentation/register/controller/register_screen_bloc.dart';

import '../../../core/util/app_module.dart';
import '../../../core/util/app_restart.dart';
import '../../common/sub_appbar_widget.dart';
import '../component/register_screen_bloc_builder_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterScreenBloc>(
      create: (context) => di<RegisterScreenBloc>(),
      child: BlocListener<RegisterScreenBloc, RegisterScreenState>(
        listener: (context, state) {
          if (state.registerRequestState == RequestStateEnum.success) {
            restartApp(context);
          }
        },
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(AppSize.width, AppSize.subAppbarHeight),
              child: SubAppbarWidget(title: AppString.register.i18n()),
            ),
            body: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                vertical: AppSize.marginHeightDoubleExtraSmall,
                horizontal: AppSize.marginWidthExtraSmall,
              ),
              child: const RegisterScreenBlocBuilderWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
