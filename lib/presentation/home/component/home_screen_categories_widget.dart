import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/core/util/app_navigator.dart';
import 'package:store/core/util/app_routes.dart';
import 'package:store/core/util/size_manager.dart';
import 'package:store/core/util/ui_constant.dart';
import 'package:store/presentation/common/spacer_widget.dart';

import '../../../domain/entity/category.dart';

class HomeScreenCategoriesWidget extends StatelessWidget {
  final List<Category> categories;

  const HomeScreenCategoriesWidget({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: AppSize.marginWidthExtraSmall,
        left: AppSize.marginWidthExtraSmall,
        top: AppSize.marginHeightLarge,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (AppSize.width / UIConstant.homeCategoryCardWidth).floor(),
          childAspectRatio: UIConstant.homeCategoryCardAspectRatio,
          crossAxisSpacing: AppSize.width0_02,
          mainAxisSpacing: AppSize.width0_02,
        ),
        itemCount: categories.length,
        itemBuilder: (context, i) => categoryCard(context, i),
      ),
    );
  }

  Widget categoryCard(BuildContext context, int i) {
    return InkWell(
      onTap: () => _categoryCardClick(context, categories[i].id),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.paddingWidthDoubleExtraSmall,
            vertical: AppSize.paddingHeightDoubleExtraSmall,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(categories[i].name),
              SpacerWidget(
                height: AppSize.height0_01,
              ),
              CachedNetworkImage(
                width: AppSize.width2,
                height: AppSize.width2,
                imageUrl: categories[i].image,
                fit: BoxFit.contain,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _categoryCardClick(BuildContext context, int categoryId) {
    AppNavigator.push(context, Routes.routeCategory, data: categoryId);
  }
}
