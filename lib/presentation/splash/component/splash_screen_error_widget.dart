import 'package:flutter/material.dart';

class SplashScreenErrorWidget extends StatelessWidget {
  final String message;

  const SplashScreenErrorWidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
