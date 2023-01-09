import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store/core/theme/app_color.dart';
import 'package:store/core/util/size_manager.dart';

import '../../core/util/ui_constant.dart';
import 'spacer_widget.dart';

class RatingbarWidget extends StatelessWidget {
  final double rating;
  final int ratersCount;

  const RatingbarWidget({
    Key? key,
    required this.rating,
    required this.ratersCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: AppColor.yellow,
          ),
          itemCount: UIConstant.ratingbarStarsCount,
          itemSize: AppSize.width0_04,
          direction: Axis.horizontal,
        ),
        SpacerWidget(
          width: AppSize.width0_01,
        ),
        Text(ratersCount.toString()),
      ],
    );
  }
}
