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
  final IncreaseCartItemRequest request;

  const CartScreenIncreaseCartItemEvent(this.request);

  @override
  List<Object> get props => [request];
}

class CartScreenDecreaseCartItemEvent extends CartScreenEvent {
  final DecreaseCartItemRequest request;

  const CartScreenDecreaseCartItemEvent(this.request);

  @override
  List<Object> get props => [request];
}
