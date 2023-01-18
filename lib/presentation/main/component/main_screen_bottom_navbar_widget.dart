import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/main/controller/main_screen_bloc.dart';

import '../../../app/util/app_constant.dart';

class MainScreenBottomNavbarWidget extends StatelessWidget {
  const MainScreenBottomNavbarWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      buildWhen: (prev, current) => prev.screenIndex != current.screenIndex,
      builder: (context, state) {
        return _bottomNavbar(context, state.screenIndex);
      },
    );
  }

  Widget _bottomNavbar(BuildContext context, int i) {
    return BottomNavigationBar(
      currentIndex: i,
      onTap: (i) => _changeSelectedScreen(context, i),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), label: AppConstant.emptyStr),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: AppConstant.emptyStr),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: AppConstant.emptyStr),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu), label: AppConstant.emptyStr),
      ],
    );
  }

  /// bottom nav bar on tap
  void _changeSelectedScreen(BuildContext context, int i) {
    BlocProvider.of<MainScreenBloc>(context).add(MainScreenBottomNavBarChangeEvent(i));
  }
}
