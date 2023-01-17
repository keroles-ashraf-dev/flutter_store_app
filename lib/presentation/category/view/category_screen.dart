import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/service_locator/app_module.dart';
import 'package:store/core/util/ui_constant.dart';
import 'package:store/domain/entity/filter.dart';
import 'package:store/domain/entity/get_category_products_request.dart';
import 'package:store/presentation/category/controller/category_screen_bloc.dart';
import 'package:store/presentation/common/filter_bottom_sheet_widget.dart';

import '../../../core/util/size_manager.dart';
import '../../../domain/entity/pagination.dart';
import '../../common/sub_appbar_widget.dart';
import '../component/category_screen_content_builder_widget.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  late final String categoryName;
  late final int categoryId;

  @override
  Widget build(BuildContext context) {
    _getArgs(context);
    return BlocProvider<CategoryScreenBloc>(
      create: (_) {
        return sl<CategoryScreenBloc>()
          ..add(CategoryScreenGetCategoryProductsEvent(
            GetCategoryProductsRequest(categoryId: categoryId),
          ));
      },
      child: BlocBuilder<CategoryScreenBloc, CategoryScreenState>(
        /// builder for just provide a new context with bloc accessible
        buildWhen: (prev, current) => false,
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: _appbar(context),
              body: Container(
                width: AppSize.width,
                margin: EdgeInsets.symmetric(
                  horizontal: AppSize.marginWidthExtraSmall,
                ),
                child: CategoryScreenContentBuilderWidget(
                  categoryId: categoryId,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSize _appbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(AppSize.width, UIConstant.subAppbarHeight),
      child: SubAppbarWidget(
        title: categoryName,
        actions: [
          InkWell(
            onTap: () => _showFilterView(context),
            child: const Icon(Icons.filter_alt_outlined),
          ),
        ],
      ),
    );
  }

  Future<void> _showFilterView(BuildContext context) async {
    final bloc = BlocProvider.of<CategoryScreenBloc>(context);

    final Filter? res = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => FilterBottomSheetWidget(
        filter: bloc.state.filter,
      ),
    );

    if (res == null) return;

    final request = GetCategoryProductsRequest(
      categoryId: categoryId,
      pagination: const Pagination.initial(),
      filter: res,
    );

    bloc.add(CategoryScreenGetCategoryProductsEvent(request));
  }

  /// get passed arguments
  void _getArgs(BuildContext context) {
    final RouteSettings? settings = ModalRoute.of(context)?.settings;
    if (settings == null) return;

    final args = settings.arguments as Map<String, dynamic>;

    categoryName = args['name'];
    categoryId = args['id'];
  }
}
