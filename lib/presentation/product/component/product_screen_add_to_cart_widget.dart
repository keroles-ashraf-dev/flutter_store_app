import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theme/app_color.dart';
import 'package:store/presentation/product/controller/product_screen_bloc.dart';
import 'package:store/presentation/resource/component/info_dialog_widget.dart';
import 'package:store/presentation/resource/size_manager.dart';

import '../../../core/util/enum.dart';

class ProductScreenAddToCartWidget extends StatelessWidget {
  const ProductScreenAddToCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductScreenBloc, ProductScreenState>(
      listenWhen: (prev, current) {
        return current.addToCartRequestState == RequestStateEnum.failure;
      },
      listener: (context, state) async {
        await _showErrorDialog(context, state.addToCartError);
      },
      buildWhen: (prev, current) {
        return prev.addToCartRequestState != current.addToCartRequestState;
      },
      builder: (context, state) {
        switch (state.addToCartRequestState) {
          case RequestStateEnum.initializing:
            return _blockSurface(context);
          case RequestStateEnum.loading:
            return _blockSurface(context, show: true);
          case RequestStateEnum.success:
            return _blockSurface(context);
          case RequestStateEnum.failure:
            return _blockSurface(context);
        }
      },
    );
  }

  Future<void> _showErrorDialog(BuildContext context, String error) async {
   await showDialog(
      context: context,
      builder: (context) {
        return InfoDialogWidget(message: error);
      },
    );
  }

  Widget _blockSurface(BuildContext context, {bool show = false}) {
    return Visibility(
      visible: show,
      child: Container(
        height: AppSize.height,
        width: AppSize.width,
        color: AppColor.overlay,
        child: const Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
