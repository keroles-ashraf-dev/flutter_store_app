import 'package:flutter/material.dart';
import 'package:store/core/util/size_manager.dart';

class MainScreenAppbarAddressWidget extends StatelessWidget {
  const MainScreenAppbarAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: AppSize.height0_05,
        toolbarHeight: AppSize.height0_05,
        floating: false,
        elevation: AppSize.elevationZero,
        flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints _) {
          return Container(
            color: Colors.amber,
            width: AppSize.width,
            height: AppSize.height0_05,
          );
        }));
  }
}
