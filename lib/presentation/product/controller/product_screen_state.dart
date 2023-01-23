part of 'product_screen_bloc.dart';

class ProductScreenState extends Equatable {
  final RequestStateEnum productRequestState;
  final RequestStateEnum addToCartRequestState;
  final Product product;
  final String getProductError;
  final String addToCartError;

  const ProductScreenState({
    this.productRequestState = RequestStateEnum.loading,
    this.addToCartRequestState = RequestStateEnum.success,
    this.product = const Product.empty(),
    this.getProductError = AppConstant.emptyStr,
    this.addToCartError = AppConstant.emptyStr,
  });

  ProductScreenState copyWith({
    RequestStateEnum? productRequestState,
    RequestStateEnum? addToCartRequestState,
    Product? product,
    String? getProductError,
    String? addToCartError,
  }) {
    return ProductScreenState(
      productRequestState: productRequestState ?? this.productRequestState,
      addToCartRequestState: addToCartRequestState ?? this.addToCartRequestState,
      product: product ?? this.product,
      getProductError: getProductError ?? this.getProductError,
      addToCartError: addToCartError ?? this.addToCartError,
    );
  }

  @override
  List<Object> get props => [
        productRequestState,
        addToCartRequestState,
        product,
        getProductError,
        addToCartError,
      ];
}
