import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:localization/localization.dart';
import 'package:store/app/i18n/app_string.dart';
import 'package:store/app/util/enum.dart';
import 'package:store/presentation/common/elevated_btn_widget.dart';
import 'package:store/presentation/common/radio_tile_widget.dart';
import 'package:store/presentation/common/spacer_widget.dart';

import '../../../app/util/app_constant.dart';
import '../../../domain/entity/cart.dart';
import '../../resource/size_manager.dart';

class CartScreenCheckoutWidget extends StatelessWidget {
  final Cart cart;

  CartScreenCheckoutWidget({Key? key, required this.cart}) : super(key: key);

  PaymentMethodEnum _selectedPaymentRadio = PaymentMethodEnum.cash;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _itemCart(AppString.items.i18n(), cart.subtotal.toString()),
        SpacerWidget(height: AppSize.height0_01),
        _itemCart(AppString.shipping.i18n(), cart.shipping.toString()),
        SpacerWidget(height: AppSize.height0_01),
        _itemCart(AppString.vat.i18n(), cart.vat.toString()),
        SpacerWidget(height: AppSize.height0_01),
        _itemCart(AppString.total.i18n(), cart.total.toString()),
        SpacerWidget(height: AppSize.height0_02),
        _paymentMethodWidget(),
        SpacerWidget(height: AppSize.height0_03),
        ElevatedBtnWidget(
          width: AppSize.width8,
          text: AppString.placeOrder.i18n(),
          action: _checkoutAction,
        ),
      ],
    );
  }

  Widget _itemCart(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title + AppConstant.colonSign),
        Text(value),
      ],
    );
  }

  Widget _paymentMethodWidget() {
    return StatefulBuilder(
      builder: (_, setState) {
        return SizedBox(
          width: AppSize.width8,
          child: ListView.builder(
            shrinkWrap: true,
              itemCount: PaymentMethodEnum.values.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
            return RadioTaleWidget(
              title: PaymentMethodEnum.values[i].name.i18n(),
              value: PaymentMethodEnum.values[i],
              groupValue: _selectedPaymentRadio,
              onChanged: _paymentRadioOnChanged,
            );
          }),
        );
      },
    );
  }

  void _paymentRadioOnChanged(PaymentMethodEnum val, Function setState) {
    _selectedPaymentRadio = val;
    setState();
  }

  void _checkoutAction() {}
}
