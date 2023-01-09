import 'package:flutter/material.dart';

class HomeScreenErrorWidget extends StatelessWidget {
  final String error;
  const HomeScreenErrorWidget({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}
