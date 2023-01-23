part of 'deal_screen_bloc.dart';

class DealScreenState extends Equatable {
  final RequestStateEnum dealRequestState;
  final RequestStateEnum addToCartRequestState;
  final Deal deal;
  final String getDealError;
  final String addToCartError;

  const DealScreenState({
    this.dealRequestState = RequestStateEnum.loading,
    this.addToCartRequestState = RequestStateEnum.success,
    this.deal = const Deal.empty(),
    this.getDealError = AppConstant.emptyStr,
    this.addToCartError = AppConstant.emptyStr,
  });

  DealScreenState copyWith({
    RequestStateEnum? dealRequestState,
    RequestStateEnum? addToCartRequestState,
    Deal? deal,
    String? getDealError,
    String? addToCartError,
  }) {
    return DealScreenState(
      dealRequestState: dealRequestState ?? this.dealRequestState,
      addToCartRequestState: addToCartRequestState ?? this.addToCartRequestState,
      deal: deal ?? this.deal,
      getDealError: getDealError ?? this.getDealError,
      addToCartError: addToCartError ?? this.addToCartError,
    );
  }

  @override
  List<Object> get props => [
        dealRequestState,
        addToCartRequestState,
        deal,
        getDealError,
        addToCartError,
      ];
}
