import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/domain/entity/get_category_products_request.dart';
import 'package:store/presentation/category/controller/category_screen_bloc.dart';

import '../../../core/util/app_module.dart';
import '../../../core/util/size_manager.dart';
import '../../common/sub_appbar_widget.dart';
import '../component/category_screen_content_builder_widget.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  late final String categoryName;
  late final int categoryId;

  @override
  Widget build(BuildContext context) {
    _getArgs(context);
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(AppSize.width, AppSize.subAppbarHeight),
          child: SubAppbarWidget(title: categoryName)),
      body: BlocProvider<CategoryScreenBloc>(
        create: (context) {
          return di<CategoryScreenBloc>()
            ..add(
              CategoryScreenGetCategoryProductsEvent(
                GetCategoryProductsRequest(categoryId: categoryId),
              ),
            );
        },
        child: Container(
          width: AppSize.width,
          margin: EdgeInsets.symmetric(
            horizontal: AppSize.marginWidthExtraSmall,
          ),
          child: CategoryScreenContentBuilderWidget(categoryId: categoryId),
        ),
      ),
    ));
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
