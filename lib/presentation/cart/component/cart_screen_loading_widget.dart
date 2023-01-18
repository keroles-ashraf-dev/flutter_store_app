import 'package:flutter/material.dart';

class CartScreenLoadingWidget extends StatelessWidget {
  const CartScreenLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: const CircularProgressIndicator());
  }
}
