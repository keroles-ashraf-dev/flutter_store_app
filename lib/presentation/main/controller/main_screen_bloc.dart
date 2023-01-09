import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/app_constant.dart';
import '../../../core/util/ui_constant.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(const MainScreenInitialState()) {
    on<MainScreenBottomNavBarChangeEvent>(_changeMainScreenBottomNavBar);
  }

  void _changeMainScreenBottomNavBar(
      MainScreenBottomNavBarChangeEvent event, Emitter<MainScreenState> emit) {
    emit(MainScreenBottomNavBarState(event.screenIndex));
  }
}
