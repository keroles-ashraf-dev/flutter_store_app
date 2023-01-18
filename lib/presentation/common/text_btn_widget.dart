import 'package:flutter/material.dart';

import '../resource/size_manager.dart';

class TextBtnWidget extends StatelessWidget {
  final String text;
  final Function action;
  final double? height;
  final double? width;

  const TextBtnWidget({
    Key? key,
    required this.text,
    required this.action,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => action(),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(width ?? AppSize.width5, height ?? AppSize.height0_06)),
      ),
      child: Text(text),
    );
  }
}
