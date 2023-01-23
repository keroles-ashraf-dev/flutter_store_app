import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/debug/function.dart';
import 'package:store/presentation/resource/function.dart';

import '../../../core/session/session.dart';

part 'logout_screen_event.dart';

part 'logout_screen_state.dart';

class LogoutScreenBloc extends Bloc<LogoutScreenEvent, LogoutScreenState> {
  final Session session;

  LogoutScreenBloc(this.session) : super(const LogoutScreenState()) {
    on<LogoutScreenEvent>(_logoutEvent);
  }

  Future<void> _logoutEvent(LogoutScreenEvent event, Emitter<LogoutScreenState> emit) async {
    final success = await session.logout();

    if (success) await delayScreenChanging().then((_) => emit(state.copyWith(loggedOut: true)));
  }
}
