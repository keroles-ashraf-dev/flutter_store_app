import 'package:flutter/material.dart';
import 'package:store/core/util/app_constant.dart';
import 'package:store/core/util/size_manager.dart';
import 'package:store/core/util/ui_helper.dart';

import '../../core/navigation/app_navigator.dart';

class SubAppbarWidget extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const SubAppbarWidget({
    Key? key,
    this.title = AppConstant.emptyStr,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIHelper.paddingSTEB(end: AppSize.paddingWidthDoubleExtraSmall),
      child: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: InkWell(
          onTap: () => AppNavigator.pop(context),
          child: const Icon(Icons.arrow_back_ios),
        ),
        actions: actions,
      ),
    );
  }
}
