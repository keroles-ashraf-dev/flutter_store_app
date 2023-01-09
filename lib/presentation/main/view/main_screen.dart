import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/util/di.dart';
import 'package:store/presentation/common/loading_screen.dart';
import 'package:store/presentation/main/component/main_screen_content.dart';
import 'package:store/presentation/main/controller/main_screen_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainScreenBloc>(
      create: (context) => di<MainScreenBloc>(),
      child: BlocBuilder<MainScreenBloc, MainScreenState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is MainScreenInitialState) {
            return MainScreenContent(screenIndex: state.screenIndex);
          } else if (state is MainScreenBottomNavBarState) {
            return MainScreenContent(screenIndex: state.screenIndex);
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
