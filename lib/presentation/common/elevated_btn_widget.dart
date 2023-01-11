import 'package:flutter/material.dart';

import '../../core/util/size_manager.dart';

class ElevatedBtnWidget extends StatelessWidget {
  final String text;
  final Function action;
  final double? height;
  final double? width;

  const ElevatedBtnWidget(
      {Key? key,
      required this.text,
      required this.action,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => action(),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? AppSize.width5, height ?? AppSize.height0_06),
      ),
      child: Text(text),
    );
  }
}
