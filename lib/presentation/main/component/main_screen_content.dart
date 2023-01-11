import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/account/view/account_screen.dart';
import 'package:store/presentation/home/view/home_screen.dart';
import 'package:store/presentation/more/view/more_screen.dart';

import '../controller/main_screen_bloc.dart';

class MainScreenContent extends StatelessWidget {
  MainScreenContent({super.key});

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
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      buildWhen: (prev, current) => prev.screenIndex != current.screenIndex,
      builder: (context, state) {
        return _navigationScreens[state.screenIndex];
      },
    );
  }
}
