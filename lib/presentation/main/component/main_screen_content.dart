import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/app/debug/function.dart';
import 'package:store/presentation/account/view/account_screen.dart';
import 'package:store/presentation/cart/view/cart_screen.dart';
import 'package:store/presentation/home/view/home_screen.dart';
import 'package:store/presentation/more/view/more_screen.dart';

import '../../../app/navigation/app_route.dart';
import '../../../app/navigation/routes.dart';
import '../controller/main_screen_bloc.dart';

class MainScreenContent extends StatelessWidget {
  const MainScreenContent({super.key});

  // final List<Widget> _navigationScreens = [
  //   const HomeScreen(),
  //   const AccountScreen(),
  //   const CartScreen(),
  //   const MoreScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    log('main screen content build');
    return Navigator(
      key: BlocProvider.of<MainScreenBloc>(context).mainScreenNavigatorKey,
      initialRoute: Routes.routeHome,
      onGenerateRoute: AppRoute.onGenerateRoute,
      onGenerateInitialRoutes: (_, route) {
        log('onGenerateInitialRoutes$route');
        return [AppRoute.onGenerateRoute(RouteSettings(name: route))];
      },
    );
    // return BlocBuilder<MainScreenBloc, MainScreenState>(
    //   buildWhen: (prev, current) => prev.screenIndex != current.screenIndex,
    //   builder: (context, state) {
    //     return _navigationScreens[state.screenIndex];
    //   },
    // );
  }
}
