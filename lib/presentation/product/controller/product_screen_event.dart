part of 'product_screen_bloc.dart';

abstract class ProductScreenEvent extends Equatable {
  const ProductScreenEvent();
}

class ProductScreenGetProductDataEvent extends ProductScreenEvent {
  final GetProductRequest getProductRequest;

  const ProductScreenGetProductDataEvent(this.getProductRequest);

  @override
  List<Object> get props => [getProductRequest];
}

class ProductScreenAddToCartEvent extends ProductScreenEvent {
  final AddToCartRequest addToCartRequest;

  const ProductScreenAddToCartEvent(this.addToCartRequest);

  @override
  List<Object> get props => [addToCartRequest];
}
