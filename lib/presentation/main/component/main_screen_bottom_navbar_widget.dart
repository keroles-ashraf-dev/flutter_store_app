import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/main/controller/main_screen_bloc.dart';

class MainScreenBottomNavbarWidget extends StatelessWidget {
  final int screenIndex;

  const MainScreenBottomNavbarWidget({super.key, required this.screenIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: screenIndex,
      onTap: (i) => _changeSelectedScreen(context, i),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
      ],
    );
  }

  /// bottom nav bar on tap
  void _changeSelectedScreen(BuildContext context, int i) {
    BlocProvider.of<MainScreenBloc>(context)
        .add(MainScreenBottomNavBarChangeEvent(i));
  }
}
