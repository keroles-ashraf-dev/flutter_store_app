import 'package:flutter/material.dart';

import '../size_manager.dart';

class IconBtnWidget extends StatelessWidget {
  final IconData icon;
  final Function action;
  final EdgeInsetsGeometry padding;
  final double? height;
  final double? width;

  const IconBtnWidget({
    Key? key,
    required this.icon,
    required this.action,
    required this.padding,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => action(),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
            Size(width ?? AppSize.width0_01, height ?? AppSize.width0_01)),
        padding: MaterialStateProperty.all(padding)
      ),
      icon: Icon(icon),
    );
  }
}
