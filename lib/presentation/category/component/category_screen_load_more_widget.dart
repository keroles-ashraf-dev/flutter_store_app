import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/util/app_constant.dart';
import 'package:store/core/util/size_manager.dart';
import 'package:store/core/util/ui_constant.dart';
import 'package:store/domain/entity/get_category_products_request.dart';
import 'package:store/domain/entity/pagination.dart';
import 'package:store/presentation/common/center_error_widget.dart';
import 'package:store/presentation/common/elevated_btn_widget.dart';

import '../../../core/util/enum.dart';
import '../controller/category_screen_bloc.dart';

class CategoryScreenLoadMoreWidget extends StatelessWidget {
  final int categoryId;
  final int productsLen;

  const CategoryScreenLoadMoreWidget({
    Key? key,
    required this.categoryId,
    required this.productsLen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width,
      margin: EdgeInsets.symmetric(
        vertical: AppSize.marginHeightDoubleExtraSmall,
      ),
      alignment: Alignment.center,
      child: BlocBuilder<CategoryScreenBloc, CategoryScreenState>(
        buildWhen: (prev, current) {
          return prev.loadMoreCategoryProductsRequestState !=
              current.loadMoreCategoryProductsRequestState;
        },
        builder: (context, state) {
          switch (state.loadMoreCategoryProductsRequestState) {
            case RequestStateEnum.initializing:
              return _loadMoreView(context, state.noMoreProducts);
            case RequestStateEnum.loading:
              return _loadMoreLoadingView();
            case RequestStateEnum.success:
              return _loadMoreView(context, state.noMoreProducts);
            case RequestStateEnum.failure:
              return _loadMoreView(context, state.noMoreProducts, error: state.loadMoreCategoryProductsError);
          }
        },
      ),
    );
  }

  Widget _loadMoreLoadingView() {
    return SizedBox(
      height: AppSize.width0_05,
      width: AppSize.width0_05,
      child: const CircularProgressIndicator.adaptive(),
    );
  }

  Widget _loadMoreView(BuildContext context, bool noMoreProducts, {String error = AppConstant.emptyStr}) {
    if(noMoreProducts) return const SizedBox.shrink();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
          visible: error.isNotEmpty,
          child: CenterErrorWidget(error: error),
        ),
        ElevatedBtnWidget(
          text: AppString.more,
          action: () => _loadMore(context),
        ),
      ],
    );
  }

  void _loadMore(BuildContext context) {
    final request = GetCategoryProductsRequest(
      categoryId: categoryId,
      pagination: Pagination(
        itemsCount: UIConstant.paginationItemsCountCount,
        offset: productsLen,
      ),
    );

    BlocProvider.of<CategoryScreenBloc>(context)
        .add(CategoryScreenLoadMoreCategoryProductsEvent(request));
  }
}
