import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/common/loading_screen.dart';
import 'package:store/presentation/login/component/login_screen_content_widget.dart';
import 'package:store/presentation/login/component/login_screen_form_widget.dart';

import '../../../core/util/enum.dart';
import '../controller/login_screen_bloc.dart';

class LoginScreenBlocBuilderWidget extends StatelessWidget {
  const LoginScreenBlocBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
      buildWhen: (previous, current) {
        return (previous != current &&
            previous.loginRequestState != RequestStateEnum.success);
      },
      builder: (context, state) {
        switch (state.loginRequestState) {
          case RequestStateEnum.initializing:
            return LoginScreenContentWidget(
              loginRequest: state.loginRequest,
              validationErrors: state.validationErrors,
              serverError: state.serverError,
            );
          case RequestStateEnum.loading:
            return const LoadingScreen();
          case RequestStateEnum.failure:
            return LoginScreenContentWidget(
              loginRequest: state.loginRequest,
              validationErrors: state.validationErrors,
              serverError: state.serverError,
            );
          case RequestStateEnum.success:
            return const LoadingScreen();
        }
      },
    );
  }
}
