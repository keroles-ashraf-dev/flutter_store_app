import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/util/enum.dart';
import 'package:store/presentation/home/component/home_screen_carousel_loading_widget.dart';
import 'package:store/presentation/home/component/home_screen_error_widget.dart';

import '../../../core/debug/function.dart';
import '../controller/home_screen_bloc.dart';
import 'home_screen_carousel_widget.dart';

class HomeScreenCarouselBuilderWidget extends StatelessWidget {
  const HomeScreenCarouselBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      buildWhen: (prev, current) {
        return prev.carouselRequestState != current.carouselRequestState;
      },
      builder: (context, state) {
        switch (state.carouselRequestState) {
          case RequestStateEnum.initializing:
            return const HomeScreenCarouselLoadingWidget();
          case RequestStateEnum.loading:
            return const HomeScreenCarouselLoadingWidget();
          case RequestStateEnum.success:
            return HomeScreenCarouselWidget(carousel: state.carousel);
          case RequestStateEnum.failure:
            return HomeScreenErrorWidget(error: state.carouselError);
        }
      },
    );
  }
}
