import 'package:flutter/material.dart';
import 'package:store/core/theme/app_style.dart';
import 'package:store/core/util/size_manager.dart';

import '../../core/theme/app_color.dart';

class FormErrorWidget extends StatelessWidget {
  final String message;

  const FormErrorWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width7,
      padding: EdgeInsets.symmetric(
        vertical: AppSize.paddingHeightDoubleExtraSmall,
        horizontal: AppSize.paddingWidthDoubleExtraSmall,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.redLight,
        borderRadius: BorderRadius.circular(AppSize.radiusSmall),
      ),
      child: Text(
        message,
        style: AppStyle.textMedium(color: AppColor.redDark),
      ),
    );
  }
}
