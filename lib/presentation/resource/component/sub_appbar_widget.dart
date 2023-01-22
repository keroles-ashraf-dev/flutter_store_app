import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigator.dart';
import '../../../core/util/app_constant.dart';
import '../size_manager.dart';
import '../ui_helper.dart';

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
