import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../core/i18n/app_string.dart';

class CartScreenEmptyWidget extends StatelessWidget {
  const CartScreenEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(AppString.emptyCart.i18n()));
  }
}
