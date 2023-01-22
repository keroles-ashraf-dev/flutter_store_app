import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/home/component/home_screen_categories_loading_widget.dart';
import 'package:store/presentation/home/component/home_screen_categories_widget.dart';

import '../../../core/util/enum.dart';
import '../../resource/component/center_error_widget.dart';
import '../controller/home_screen_bloc.dart';

class HomeScreenCategoriesBuilderWidget extends StatelessWidget {
  const HomeScreenCategoriesBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      buildWhen: (prev, current) {
        return prev.categoriesRequestState != current.categoriesRequestState;
      },
      builder: (context, state) {
        switch (state.carouselRequestState) {
          case RequestStateEnum.initializing:
            return const HomeScreenCategoriesLoadingWidget();
          case RequestStateEnum.loading:
            return const HomeScreenCategoriesLoadingWidget();
          case RequestStateEnum.success:
            return HomeScreenCategoriesWidget(categories: state.categories);
          case RequestStateEnum.failure:
            return CenterErrorWidget(error: state.categoriesError);
        }
      },
    );
  }
}
