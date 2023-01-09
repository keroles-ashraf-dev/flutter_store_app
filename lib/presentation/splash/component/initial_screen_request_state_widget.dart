import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/enum.dart';
import '../controller/initial_screen_bloc.dart';
import 'initial_screen_error_widget.dart';
import 'initial_screen_progress_widget.dart';

class InitialScreenRequestStateWidget extends StatelessWidget {
  const InitialScreenRequestStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialScreenBloc, InitialScreenState>(
      buildWhen: (previous, current) {
        return (previous != current &&
            previous.getUserDataRequestState != RequestStateEnum.success);
      },
      builder: (context, state) {
        switch (state.getUserDataRequestState) {
          case RequestStateEnum.initializing:
            return const InitialScreenProgressWidget();
          case RequestStateEnum.loading:
            return const InitialScreenProgressWidget();
          case RequestStateEnum.success:
            return const InitialScreenProgressWidget();
          case RequestStateEnum.failure:
            return InitialScreenErrorWidget(message: state.serverError);
        }
      },
    );
  }
}
