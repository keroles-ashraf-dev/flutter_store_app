import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/resource/component/spacer_widget.dart';
import 'package:store/presentation/splash/component/splash_screen_request_state_widget.dart';
import 'package:store/presentation/splash/controller/splash_screen_bloc.dart';

import '../../../core/navigation/app_navigator.dart';
import '../../../core/navigation/routes.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/util/asset_manager.dart';
import '../../../core/util/enum.dart';
import '../../resource/size_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashScreenBloc>(
      create: (context) {
        /// call getting data event
        return sl<SplashScreenBloc>()
          ..add(const SplashScreenGetUserDataEvent());
      },
      child: BlocListener<SplashScreenBloc, SplashScreenState>(
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
                  const SplashScreenRequestStateWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
