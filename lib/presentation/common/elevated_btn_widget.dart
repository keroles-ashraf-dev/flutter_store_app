import 'package:flutter/material.dart';

class ElevatedBtnWidget extends StatelessWidget {
  final String text;
  final Function action;

  const ElevatedBtnWidget({Key? key, required this.text, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => action(),
      child: Text(text),
    );
  }
}
