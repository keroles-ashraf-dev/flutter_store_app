import 'package:flutter/cupertino.dart';
import 'package:store/core/theme/app_color.dart';
import 'package:store/presentation/resource/component/icon_btn_widget.dart';
import 'package:store/presentation/resource/size_manager.dart';

class ItemQuantityWidget extends StatelessWidget {
  final int quantity;

  const ItemQuantityWidget({Key? key, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.disabled, width: AppSize.borderWidthSmall),
        borderRadius: BorderRadius.circular(AppSize.radiusSmall),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconBtnWidget(
            icon: CupertinoIcons.add,
            action: _increment,
            padding: EdgeInsets.zero,
          ),
          Text(quantity.toString()),
          IconBtnWidget(
            icon: CupertinoIcons.minus,
            action: _decrement,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  void _increment() {}

  void _decrement() {}
}
