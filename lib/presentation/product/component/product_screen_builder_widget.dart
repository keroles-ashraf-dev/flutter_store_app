import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/presentation/resource/component/center_error_widget.dart';
import 'package:store/presentation/product/component/product_screen_loading_widget.dart';
import 'package:store/presentation/product/controller/product_screen_bloc.dart';

import '../../../core/util/enum.dart';
import 'product_screen_product_widget.dart';

class ProductScreenBuilderWidget extends StatelessWidget {
  const ProductScreenBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductScreenBloc, ProductScreenState>(
      buildWhen: (prev, current) {
        return prev.productRequestState != current.productRequestState;
      },
      builder: (context, state) {
        switch (state.productRequestState) {
          case RequestStateEnum.initializing:
            return const ProductScreenLoadingWidget();
          case RequestStateEnum.loading:
            return const ProductScreenLoadingWidget();
          case RequestStateEnum.success:
            return ProductScreenProductWidget(product: state.product);
          case RequestStateEnum.failure:
            return CenterErrorWidget(error: state.getProductError);
        }
      },
    );
  }
}
