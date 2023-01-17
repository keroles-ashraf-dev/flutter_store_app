import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/util/enum.dart';
import '../controller/splash_screen_bloc.dart';
import 'splash_screen_error_widget.dart';
import 'splash_screen_progress_widget.dart';

class SplashScreenRequestStateWidget extends StatelessWidget {
  const SplashScreenRequestStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashScreenBloc, SplashScreenState>(
      buildWhen: (previous, current) {
        return (previous != current && previous.getUserDataRequestState != RequestStateEnum.success);
      },
      builder: (context, state) {
        switch (state.getUserDataRequestState) {
          case RequestStateEnum.initializing:
            return const SplashScreenProgressWidget();
          case RequestStateEnum.loading:
            return const SplashScreenProgressWidget();
          case RequestStateEnum.success:
            return const SplashScreenProgressWidget();
          case RequestStateEnum.failure:
            return SplashScreenErrorWidget(message: state.serverError);
        }
      },
    );
  }
}
