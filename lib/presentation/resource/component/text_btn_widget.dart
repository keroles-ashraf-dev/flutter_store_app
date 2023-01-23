import 'package:flutter/material.dart';

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
        fixedSize: _size(),
      ),
      child: Text(text),
    );
  }

  MaterialStateProperty<Size>? _size() {
    if (width == null || height == null) return null;
    return MaterialStateProperty.all(Size(width!, height!));
  }
}
