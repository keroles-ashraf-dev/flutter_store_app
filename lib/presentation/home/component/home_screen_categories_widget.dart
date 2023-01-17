import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../app/navigation/app_navigator.dart';
import '../../../app/navigation/routes.dart';
import '../../../domain/entity/category.dart';
import '../../common/spacer_widget.dart';
import '../../resource/size_manager.dart';
import '../../resource/ui_constant.dart';

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
          crossAxisCount: (AppSize.width / AppSize.width3).floor(),
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
      onTap: () =>
          _categoryCardClick(context, categories[i].name, categories[i].id),
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

  void _categoryCardClick(
      BuildContext context, String categoryName, int categoryId) {
    AppNavigator.push(context, Routes.routeCategory,
        data: {'name': categoryName, 'id': categoryId});
  }
}
