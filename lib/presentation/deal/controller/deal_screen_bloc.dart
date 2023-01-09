import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'deal_screen_event.dart';
part 'deal_screen_state.dart';

class DealScreenBloc extends Bloc<DealScreenEvent, DealScreenState> {
  DealScreenBloc() : super(DealScreenInitial()) {
    on<DealScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
