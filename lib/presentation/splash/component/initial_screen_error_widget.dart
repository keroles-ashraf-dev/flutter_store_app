import 'package:flutter/material.dart';

class InitialScreenErrorWidget extends StatelessWidget {
  final String message;

  const InitialScreenErrorWidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
