part of 'main_screen_bloc.dart';

class MainScreenState extends Equatable {
  final int screenIndex;
  final RequestStateEnum addressRequestState;
  final Address address;
  final String addressError;

  const MainScreenState({
    this.screenIndex = UIConstant.mainScreenBottomNavBarDefaultIndex,
    this.addressRequestState = RequestStateEnum.loading,
    this.address = const Address.empty(),
    this.addressError = AppConstant.emptyStr,
  });

  MainScreenState copyWith({
    int? screenIndex,
    RequestStateEnum? addressRequestState,
    Address? address,
    String? addressError,
  }) {
    return MainScreenState(
      screenIndex: screenIndex ?? this.screenIndex,
      addressRequestState: addressRequestState ?? this.addressRequestState,
      address: address ?? this.address,
      addressError: addressError ?? this.addressError,
    );
  }

  @override
  List<Object> get props =>
      [screenIndex, addressRequestState, address, addressError];
}
