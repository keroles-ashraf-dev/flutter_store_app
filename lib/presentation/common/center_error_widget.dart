import 'package:flutter/material.dart';

class CenterErrorWidget extends StatelessWidget {
  final String error;
  const CenterErrorWidget({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}
