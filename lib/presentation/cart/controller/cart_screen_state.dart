part of 'cart_screen_bloc.dart';

class CartScreenState extends Equatable {
  final RequestStateEnum cartRequestState;
  final RequestStateEnum cartUpdatingRequestState;
  final Cart cart;
  final String getCartError;
  final String updatingCartError;

  const CartScreenState({
    this.cartRequestState = RequestStateEnum.loading,
    this.cartUpdatingRequestState = RequestStateEnum.success,
    this.cart = const Cart.empty(),
    this.getCartError = AppConstant.emptyStr,
    this.updatingCartError = AppConstant.emptyStr,
  });

  CartScreenState copyWith({
    RequestStateEnum? cartRequestState,
    RequestStateEnum? cartUpdatingRequestState,
    Cart? cart,
    String? getCartError,
    String? updatingCartError,
  }) {
    return CartScreenState(
      cartRequestState: cartRequestState ?? this.cartRequestState,
      cartUpdatingRequestState:
          cartUpdatingRequestState ?? this.cartUpdatingRequestState,
      cart: cart ?? this.cart,
      getCartError: getCartError ?? this.getCartError,
      updatingCartError: updatingCartError ?? this.updatingCartError,
    );
  }

  @override
  List<Object> get props => [
        cartRequestState,
        cartUpdatingRequestState,
        cart,
        getCartError,
        updatingCartError,
      ];
}
