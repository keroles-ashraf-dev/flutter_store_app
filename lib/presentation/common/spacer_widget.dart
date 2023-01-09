import 'package:flutter/material.dart';

import '../../core/util/app_constant.dart';

class SpacerWidget extends StatelessWidget {
  final double height;
  final double width;

  const SpacerWidget({Key? key, this.height = AppConstant.zeroDol, this.width = AppConstant.zeroDol,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
