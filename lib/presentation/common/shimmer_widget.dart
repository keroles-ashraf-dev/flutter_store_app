import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/theme/app_color.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;

  const ShimmerWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.greyExtraLight,
      highlightColor: AppColor.greyLight,
      child: child,
    );
  }
}
