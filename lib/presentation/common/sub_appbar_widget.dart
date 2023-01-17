import 'package:flutter/material.dart';

import '../../app/navigation/app_navigator.dart';
import '../../app/util/app_constant.dart';
import '../resource/size_manager.dart';
import '../resource/ui_helper.dart';

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
