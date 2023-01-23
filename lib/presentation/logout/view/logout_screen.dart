import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/logout/controller/logout_screen_bloc.dart';
import 'package:store/presentation/resource/component/spacer_widget.dart';

import '../../../core/i18n/app_string.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/util/app_restart.dart';
import '../../resource/size_manager.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogoutScreenBloc>(
      create: (context) {
        return sl<LogoutScreenBloc>()..add(const LogoutScreenLogoutEvent());
      },
      child: BlocListener<LogoutScreenBloc, LogoutScreenState>(
        listenWhen: (prev, current) => current.loggedOut,
        listener: (context, state) async {
          await restartApp(context, rebuildModules: true);
        },
        child: SafeArea(
          child: Scaffold(
            body: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                vertical: AppSize.marginHeightExtraLarge,
                horizontal: AppSize.marginWidthExtraSmall,
              ),
              child: Column(
                children: [
                  const Text(AppString.loggingOut),
                  SpacerWidget(height: AppSize.height0_01),
                  const CircularProgressIndicator.adaptive(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
