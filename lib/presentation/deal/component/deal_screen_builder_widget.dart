import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/resource/component/center_error_widget.dart';
import 'package:store/presentation/deal/component/deal_screen_loading_widget.dart';
import 'package:store/presentation/deal/controller/deal_screen_bloc.dart';

import '../../../core/util/enum.dart';
import 'deal_screen_deal_widget.dart';

class DealScreenBuilderWidget extends StatelessWidget {
  const DealScreenBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealScreenBloc, DealScreenState>(
      buildWhen: (prev, current) {
        return prev.dealRequestState != current.dealRequestState;
      },
      builder: (context, state) {
        switch (state.dealRequestState) {
          case RequestStateEnum.initializing:
            return const DealScreenLoadingWidget();
          case RequestStateEnum.loading:
            return const DealScreenLoadingWidget();
          case RequestStateEnum.success:
            return DealScreenDealWidget(deal: state.deal);
          case RequestStateEnum.failure:
            return CenterErrorWidget(error: state.getDealError);
        }
      },
    );
  }
}
