import 'package:flutter/material.dart';
import 'package:store/core/util/app_constant.dart';
import 'package:store/core/util/app_navigator.dart';

class SubAppbarWidget extends StatelessWidget {
  final String title;

  const SubAppbarWidget({Key? key, this.title = AppConstant.emptyStr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: InkWell(
          onTap: () => AppNavigator.pop(context), child: const Icon(Icons.arrow_back_ios)),
    );
  }
}
