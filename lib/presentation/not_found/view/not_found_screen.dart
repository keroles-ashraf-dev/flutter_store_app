import 'package:flutter/material.dart';

import '../../../core/util/app_constant.dart';
import '../../resource/component/sub_appbar_widget.dart';
import '../../resource/size_manager.dart';
import '../../resource/ui_constant.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(AppSize.width, UIConstant.subAppbarHeight),
            child: const SubAppbarWidget()),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            vertical: AppSize.marginHeightExtraLarge,
            horizontal: AppSize.marginWidthExtraSmall,
          ),
          child: const Text(AppConstant.notFound),
        ),
      ),
    );
  }
}
