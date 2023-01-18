import 'package:flutter/material.dart';

class RadioTaleWidget extends StatelessWidget {
  final String title;
  final dynamic value;
  final dynamic groupValue;
  final Function onChanged;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const RadioTaleWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.height,
    this.width,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      child: RadioListTile(
        dense: true,
        title: Text(title),
        value: value,
        groupValue: groupValue,
        onChanged: (val) => onChanged(val),
      ),
    );
  }
}
