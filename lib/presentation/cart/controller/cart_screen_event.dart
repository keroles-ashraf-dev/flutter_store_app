part of 'cart_screen_bloc.dart';

abstract class CartScreenEvent extends Equatable {
  const CartScreenEvent();
}

class CartScreenGetCartEvent extends CartScreenEvent {
  final GetCartRequest request;

  const CartScreenGetCartEvent(this.request);

  @override
  List<Object> get props => [request];
}

class CartScreenIncreaseCartItemEvent extends CartScreenEvent {
  final GetCartRequest request;

  const CartScreenIncreaseCartItemEvent(this.request);

  @override
  List<Object> get props => [request];
}
