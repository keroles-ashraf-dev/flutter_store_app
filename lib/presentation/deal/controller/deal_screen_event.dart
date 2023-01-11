part of 'deal_screen_bloc.dart';

abstract class DealScreenEvent extends Equatable {
  const DealScreenEvent();
}

class DealScreenGetDealDataEvent extends DealScreenEvent {
  final GetDealRequest getDealRequest;

  const DealScreenGetDealDataEvent(this.getDealRequest);

  @override
  List<Object> get props => [getDealRequest];
}
