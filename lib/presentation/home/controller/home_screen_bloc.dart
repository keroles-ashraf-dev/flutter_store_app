import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/domain/entity/carousel_item.dart';
import 'package:store/domain/entity/no_param.dart';

import '../../../core/error/failure.dart';
import '../../../core/util/app_constant.dart';
import '../../../core/util/enum.dart';
import '../../../domain/entity/category.dart';
import '../../../domain/entity/deal.dart';
import '../../../domain/usecase/carousel/get_main_carousel_usecase.dart';
import '../../../domain/usecase/category/get_main_categories_usecase.dart';
import '../../../domain/usecase/deal/get_deals_usecase.dart';
import '../../resource/function.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final GetMainCarouselUsecase _mainCarouselUsecase;
  final GetMainCategoriesUsecase _mainCategoriesUsecase;
  final GetDealsUsecase _dealsUsecase;

  HomeScreenBloc(
    this._mainCarouselUsecase,
    this._mainCategoriesUsecase,
    this._dealsUsecase,
  ) : super(const HomeScreenState()) {
    on<HomeScreenGetMainCarouselEvent>(_onGetCarouselEvent);
    on<HomeScreenGetMainCategoriesEvent>(_onGetCategoriesEvent);
    on<HomeScreenGetDealsEvent>(_onGetDealsEvent);
  }

  Future<void> _onGetCarouselEvent(HomeScreenGetMainCarouselEvent event,
      Emitter<HomeScreenState> emit) async {
    final res = await _mainCarouselUsecase(const NoParams());

    await delayScreenChanging().then((_) => emit(_foldGetCarouselRes(res)));
  }

  HomeScreenState _foldGetCarouselRes(
      Either<Failure, List<CarouselItem>> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
        carouselRequestState: RequestStateEnum.failure,
        carouselError: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        carouselRequestState: RequestStateEnum.success,
        carousel: r,
        carouselError: AppConstant.emptyStr,
      );
    });
  }

  Future<void> _onGetCategoriesEvent(HomeScreenGetMainCategoriesEvent event,
      Emitter<HomeScreenState> emit) async {
    final res = await _mainCategoriesUsecase(const NoParams());

    await delayScreenChanging().then((_) => emit(_foldGetCategoriesRes(res)));
  }

  HomeScreenState _foldGetCategoriesRes(
      Either<Failure, List<Category>> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
        categoriesRequestState: RequestStateEnum.failure,
        categoriesError: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        categoriesRequestState: RequestStateEnum.success,
        categories: r,
        categoriesError: AppConstant.emptyStr,
      );
    });
  }

  Future<void> _onGetDealsEvent(
      HomeScreenGetDealsEvent event, Emitter<HomeScreenState> emit) async {
    final res = await _dealsUsecase(const NoParams());

    await delayScreenChanging().then((_) => emit(_foldGetDealsRes(res)));
  }

  HomeScreenState _foldGetDealsRes(Either<Failure, List<Deal>> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
        dealsRequestState: RequestStateEnum.failure,
        dealsError: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        dealsRequestState: RequestStateEnum.success,
        deals: r,
        dealsError: AppConstant.emptyStr,
      );
    });
  }
}
