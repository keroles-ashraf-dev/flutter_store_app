part of 'deal_screen_bloc.dart';

class DealScreenState extends Equatable {
  final RequestStateEnum dealRequestState;
  final Deal deal;
  final String error;

  const DealScreenState({
    this.dealRequestState = RequestStateEnum.loading,
    this.deal = const Deal.empty(),
    this.error = AppConstant.emptyStr,
  });

  DealScreenState copyWith({
    RequestStateEnum? dealRequestState,
    Deal? deal,
    String? error,
  }) {
    return DealScreenState(
      dealRequestState: dealRequestState ?? this.dealRequestState,
      deal: deal ?? this.deal,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [dealRequestState, deal, error];
}
