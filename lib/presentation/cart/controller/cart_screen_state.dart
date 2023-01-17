part of 'cart_screen_bloc.dart';

class CartScreenState extends Equatable {
  final RequestStateEnum cartRequestState;
  final Cart cart;
  final String error;

  const CartScreenState({
    this.cartRequestState = RequestStateEnum.loading,
    this.cart = const Cart.empty(),
    this.error = AppConstant.emptyStr,
  });

  CartScreenState copyWith({
    RequestStateEnum? cartRequestState,
    Cart? cart,
    String? error,
  }) {
    return CartScreenState(
      cartRequestState: cartRequestState ?? this.cartRequestState,
      cart: cart ?? this.cart,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [cart];
}
