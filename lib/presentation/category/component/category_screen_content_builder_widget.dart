import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/category/component/category_screen_loading_widget.dart';
import 'package:store/presentation/category/component/category_screen_products_widget.dart';
import 'package:store/presentation/common/center_error_widget.dart';

import '../../../app/util/enum.dart';
import '../controller/category_screen_bloc.dart';

class CategoryScreenContentBuilderWidget extends StatelessWidget {
  final int categoryId;

  const CategoryScreenContentBuilderWidget({Key? key, required this.categoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryScreenBloc, CategoryScreenState>(
      buildWhen: (prev, current) {
        return (prev.getCategoryProductsRequestState != current.getCategoryProductsRequestState) ||
            (current.loadMoreCategoryProductsRequestState == RequestStateEnum.success
                && prev.products.length < current.products.length);
      },
      builder: (context, state) {
        switch (state.getCategoryProductsRequestState) {
          case RequestStateEnum.initializing:
            return const CategoryScreenLoadingWidget();
          case RequestStateEnum.loading:
            return const CategoryScreenLoadingWidget();
          case RequestStateEnum.success:
            return CategoryScreenProductsWidget(
                categoryId: categoryId, products: state.products);
          case RequestStateEnum.failure:
            return CenterErrorWidget(error: state.getCategoryProductsError);
        }
      },
    );
  }
}
