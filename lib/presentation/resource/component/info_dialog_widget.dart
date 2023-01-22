import 'package:flutter/material.dart';

class InfoDialogWidget extends StatelessWidget {
  final String message;

  const InfoDialogWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(message),
    );
  }
}
