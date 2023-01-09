import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/common/loading_screen.dart';
import 'package:store/presentation/register/component/register_screen_content_widget.dart';

import '../../../core/util/enum.dart';
import '../controller/register_screen_bloc.dart';

class RegisterScreenBlocBuilderWidget extends StatelessWidget {
  const RegisterScreenBlocBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterScreenBloc, RegisterScreenState>(
      buildWhen: (previous, current) {
        return (previous != current &&
            previous.registerRequestState != RequestStateEnum.success);
      },
      builder: (context, state) {
        switch (state.registerRequestState) {
          case RequestStateEnum.initializing:
            return RegisterScreenContentWidget(
              registerRequest: state.registerRequest,
              validationErrors: state.validationErrors,
              serverError: state.serverError,
            );
          case RequestStateEnum.loading:
            return const LoadingScreen();
          case RequestStateEnum.failure:
            return RegisterScreenContentWidget(
              registerRequest: state.registerRequest,
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
