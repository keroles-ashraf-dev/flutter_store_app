import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/error/failure.dart';
import '../../../app/util/app_constant.dart';
import '../../../app/util/enum.dart';
import '../../../domain/entity/filter.dart';
import '../../../domain/entity/get_category_products_request.dart';
import '../../../domain/entity/product.dart';
import '../../../domain/usecase/product/get_category_products_usecase.dart';
import '../../resource/function.dart';

part 'category_screen_event.dart';

part 'category_screen_state.dart';

class CategoryScreenBloc
    extends Bloc<CategoryScreenEvent, CategoryScreenState> {
  final GetCategoryProductsUsecase _categoryProductsUsecase;

  CategoryScreenBloc(this._categoryProductsUsecase)
      : super(const CategoryScreenState()) {
    on<CategoryScreenGetCategoryProductsEvent>(_getCategoryProductsEvent);
    on<CategoryScreenLoadMoreCategoryProductsEvent>(
        _loadMoreCategoryProductsEvent);
  }

  Future<void> _getCategoryProductsEvent(
      CategoryScreenGetCategoryProductsEvent event,
      Emitter<CategoryScreenState> emit) async {
    emit(state.copyWith(
      getCategoryProductsRequestState: RequestStateEnum.loading,
      noMoreProducts: false,
      filter: event.categoryProductsRequest.filter,
    ));

    final res = await _categoryProductsUsecase(event.categoryProductsRequest);

    await delayScreenChanging().then((_) => emit(_foldCategoryProductsRes(res)));
  }

  CategoryScreenState _foldCategoryProductsRes(Either<Failure, List<Product>> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
        getCategoryProductsRequestState: RequestStateEnum.failure,
        getCategoryProductsError: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        getCategoryProductsRequestState: RequestStateEnum.success,
        products: r,
        getCategoryProductsError: AppConstant.emptyStr,
      );
    });
  }

  Future<void> _loadMoreCategoryProductsEvent(
      CategoryScreenLoadMoreCategoryProductsEvent event,
      Emitter<CategoryScreenState> emit) async {
    emit(state.copyWith(
      loadMoreCategoryProductsRequestState: RequestStateEnum.loading,
    ));

    final res = await _categoryProductsUsecase(event.categoryProductsRequest);

    await delayScreenChanging()
        .then((_) => emit(_foldLoadMoreCategoryProductsRes(res)));
  }

  CategoryScreenState _foldLoadMoreCategoryProductsRes(
      Either<Failure, List<Product>> either) {
    return either.fold((l) {
      /// return error state to show error message
      return state.copyWith(
        loadMoreCategoryProductsRequestState: RequestStateEnum.failure,
        loadMoreCategoryProductsError: l.message,
      );
    }, (r) {
      /// return success state to show data
      return state.copyWith(
        loadMoreCategoryProductsRequestState: RequestStateEnum.success,
        products: state.products + r,
        noMoreProducts: r.isEmpty,
      );
    });
  }
}
