import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/home/component/home_screen_deals_loading_widget.dart';
import 'package:store/presentation/home/component/home_screen_deals_widget.dart';

import '../../../core/debug/function.dart';
import '../../../core/util/enum.dart';
import '../controller/home_screen_bloc.dart';
import 'home_screen_error_widget.dart';

class HomeScreenDealsBuilderWidget extends StatelessWidget {
  const HomeScreenDealsBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      buildWhen: (prev, current) {
        return prev.dealsRequestState != current.dealsRequestState;
      },
      builder: (context, state) {
        switch (state.dealsRequestState) {
          case RequestStateEnum.initializing:
            return const HomeScreenDealsLoadingWidget();
          case RequestStateEnum.loading:
            return const HomeScreenDealsLoadingWidget();
          case RequestStateEnum.success:
            return HomeScreenDealsWidget(deals: state.deals);
          case RequestStateEnum.failure:
            return HomeScreenErrorWidget(error: state.dealsError);
        }
      },
    );
  }
}
