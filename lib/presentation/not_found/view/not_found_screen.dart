import 'package:flutter/material.dart';
import 'package:store/core/util/size_manager.dart';

import '../../../core/util/app_constant.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
