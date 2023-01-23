import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/domain/entity/get_product_request.dart';
import 'package:store/presentation/product/component/product_screen_add_to_cart_widget.dart';
import 'package:store/presentation/product/component/product_screen_builder_widget.dart';
import 'package:store/presentation/product/controller/product_screen_bloc.dart';

import '../../../core/debug/function.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../resource/component/sub_appbar_widget.dart';
import '../../resource/size_manager.dart';
import '../../resource/ui_constant.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  late final int id;

  @override
  Widget build(BuildContext context) {
    _getArgs(context);
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(AppSize.width, UIConstant.subAppbarHeight),
          child: const SubAppbarWidget()),
      body: BlocProvider<ProductScreenBloc>(
        create: (context) {
          return sl<ProductScreenBloc>()
            ..add(ProductScreenGetProductDataEvent(GetProductRequest(id: id)));
        },
        child: SizedBox(
          height: AppSize.height,
          width: AppSize.width,
          child: Stack(
            children: const [
              ProductScreenBuilderWidget(),
              ProductScreenAddToCartWidget(),
            ],
          ),
        ),
      ),
    ));
  }

  /// get passed arguments
  void _getArgs(BuildContext context) {
    final RouteSettings? settings = ModalRoute.of(context)?.settings;
    if (settings == null) return;
    log(settings.arguments);

    final args = settings.arguments as Map<String, dynamic>;

    id = args['id'];
  }
}
