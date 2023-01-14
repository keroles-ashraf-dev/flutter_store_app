part of 'category_screen_bloc.dart';

abstract class CategoryScreenEvent extends Equatable {
  const CategoryScreenEvent();
}

class CategoryScreenGetCategoryProductsEvent extends CategoryScreenEvent {
  final GetCategoryProductsRequest categoryProductsRequest;

  const CategoryScreenGetCategoryProductsEvent(this.categoryProductsRequest);

  @override
  List<Object> get props => [categoryProductsRequest];
}

class CategoryScreenLoadMoreCategoryProductsEvent extends CategoryScreenEvent {
  final GetCategoryProductsRequest categoryProductsRequest;

  const CategoryScreenLoadMoreCategoryProductsEvent(this.categoryProductsRequest);

  @override
  List<Object> get props => [categoryProductsRequest];
}
