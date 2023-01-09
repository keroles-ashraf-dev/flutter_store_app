part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  final List<CarouselItem> carousel;
  final List<Category> categories;
  final List<Deal> deals;
  final String carouselError;
  final String categoriesError;
  final String dealsError;
  final RequestStateEnum carouselRequestState;
  final RequestStateEnum categoriesRequestState;
  final RequestStateEnum dealsRequestState;

  const HomeScreenState({
    this.carousel = const [CarouselItem.empty()],
    this.categories = const [Category.empty()],
    this.deals = const [Deal.empty()],
    this.carouselError = AppConstant.emptyStr,
    this.categoriesError = AppConstant.emptyStr,
    this.dealsError = AppConstant.emptyStr,
    this.carouselRequestState = RequestStateEnum.loading,
    this.categoriesRequestState = RequestStateEnum.loading,
    this.dealsRequestState = RequestStateEnum.loading,
  });

  HomeScreenState copyWith({
    List<CarouselItem>? carousel,
    List<Category>? categories,
    List<Deal>? deals,
    String? carouselError,
    String? categoriesError,
    String? dealsError,
    RequestStateEnum? carouselRequestState,
    RequestStateEnum? categoriesRequestState,
    RequestStateEnum? dealsRequestState,
  }) {
    return HomeScreenState(
      carousel: carousel ?? this.carousel,
      categories: categories ?? this.categories,
      deals: deals ?? this.deals,
      carouselError: carouselError ?? this.carouselError,
      categoriesError: categoriesError ?? this.categoriesError,
      dealsError: dealsError ?? this.dealsError,
      carouselRequestState: carouselRequestState ?? this.carouselRequestState,
      categoriesRequestState: categoriesRequestState ?? this.categoriesRequestState,
      dealsRequestState: dealsRequestState ?? this.dealsRequestState,
    );
  }

  @override
  List<Object> get props => [
        carousel,
        categories,
        deals,
        carouselError,
        categoriesError,
        dealsError,
        carouselRequestState,
        categoriesRequestState,
        dealsRequestState,
      ];
}
