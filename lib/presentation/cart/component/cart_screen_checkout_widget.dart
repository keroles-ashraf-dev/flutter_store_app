import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:localization/localization.dart';
import 'package:store/core/i18n/app_string.dart';
import 'package:store/core/util/enum.dart';
import 'package:store/presentation/resource/component/elevated_btn_widget.dart';
import 'package:store/presentation/resource/component/radio_tile_widget.dart';
import 'package:store/presentation/resource/component/spacer_widget.dart';

import '../../../core/util/app_constant.dart';
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _itemCart(AppString.items.i18n(), cart.subtotal.toString()),
        SpacerWidget(height: AppSize.height0_01),
        _itemCart(AppString.shipping.i18n(), cart.shipping.toString()),
        SpacerWidget(height: AppSize.height0_01),
        _itemCart(AppString.vat.i18n(), cart.vat.toString()),
        SpacerWidget(height: AppSize.height0_01),
        _itemCart(AppString.total.i18n(), cart.total.toString()),
        SpacerWidget(height: AppSize.height0_01),
        _paymentMethodWidget(),
        SpacerWidget(height: AppSize.height0_01),
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
        return Container(
          height: AppSize.height0_07,
          width: AppSize.width8,
          alignment: Alignment.center,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: PaymentMethodEnum.values.length,
              itemBuilder: (context, i) {
                return RadioTaleWidget(
                  width: AppSize.width3,
                  margin: EdgeInsets.symmetric(
                    horizontal: AppSize.marginWidthDoubleExtraSmall,
                  ),
                  shapeBorder: const Border(),
                  title: PaymentMethodEnum.values[i].name.i18n(),
                  value: PaymentMethodEnum.values[i],
                  groupValue: _selectedPaymentRadio,
                  onChanged: (val) => _paymentRadioOnChanged(val, setState),
                );
              }),
        );
      },
    );
  }

  void _paymentRadioOnChanged(PaymentMethodEnum val, Function setState) {
    _selectedPaymentRadio = val;
    setState(() {});
  }

  void _checkoutAction() {}
}
