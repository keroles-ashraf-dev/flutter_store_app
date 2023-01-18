import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/navigation/app_route.dart';
import '../../../app/navigation/routes.dart';
import '../controller/main_screen_bloc.dart';

class MainScreenContent extends StatelessWidget {
  const MainScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: BlocProvider.of<MainScreenBloc>(context).mainScreenNavigatorKey,
      initialRoute: Routes.routeHome,
      onGenerateRoute: AppRoute.onGenerateRoute,
      onGenerateInitialRoutes: (_, route) {
        return [AppRoute.onGenerateRoute(RouteSettings(name: route))];
      },
    );
  }
}
