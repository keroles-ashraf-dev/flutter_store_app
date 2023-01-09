import 'package:flutter/material.dart';
import 'package:store/presentation/account/view/account_screen.dart';
import 'package:store/presentation/home/view/home_screen.dart';
import 'package:store/presentation/main/component/main_screen_appbar_address_widget.dart';
import 'package:store/presentation/main/component/main_screen_bottom_navbar_widget.dart';
import 'package:store/presentation/more/view/more_screen.dart';

import '../../common/appbar_search_widget.dart';

class MainScreenContent extends StatelessWidget {
  final int screenIndex;

  MainScreenContent({super.key, required this.screenIndex});

  final List<Widget> _navigationScreens = [
    const HomeScreen(),
    const AccountScreen(),
    Container(
      color: Colors.green,
    ),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool _) {
              return <Widget>[
                const AppbarSearchWidget(),
                const MainScreenAppbarAddressWidget()
              ];
            },
            body: _navigationScreens[screenIndex],
          ),
          bottomNavigationBar:
              MainScreenBottomNavbarWidget(screenIndex: screenIndex)),
    );
  }
}
