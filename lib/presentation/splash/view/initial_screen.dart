import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/util/app_navigator.dart';
import 'package:store/core/util/asset_manager.dart';
import 'package:store/core/util/enum.dart';
import 'package:store/core/util/size_manager.dart';
import 'package:store/presentation/common/spacer_widget.dart';
import 'package:store/presentation/splash/component/initial_screen_request_state_widget.dart';
import 'package:store/presentation/splash/controller/initial_screen_bloc.dart';

import '../../../core/util/app_module.dart';
import '../../../core/util/app_routes.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InitialScreenBloc>(
      create: (context) {
        /// call getting data event
        return di<InitialScreenBloc>()
          ..add(const InitialScreenGetUserDataEvent());
      },
      child: BlocListener<InitialScreenBloc, InitialScreenState>(
        listener: (context, state) {
          if (state.getUserDataRequestState == RequestStateEnum.success) {
            AppNavigator.replace(context, Routes.routeMain);
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.symmetric(
                vertical: AppSize.marginHeightExtraLarge,
                horizontal: AppSize.marginWidthExtraSmall,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.logo,
                    height: AppSize.iconExtraLarge,
                    width: AppSize.iconExtraLarge,
                  ),
                  SpacerWidget(height: AppSize.height0_01),

                  /// handle view for getting data request state
                  const InitialScreenRequestStateWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
