import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:store/core/navigation/app_navigator.dart';
import 'package:store/presentation/resource/component/text_btn_widget.dart';

import '../../../core/i18n/app_string.dart';

class InfoDialogWidget extends StatelessWidget {
  final String message;

  const InfoDialogWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Text(message),
      actions: [
        TextBtnWidget(
          action: () => AppNavigator.pop(context),
          text: AppString.ok.i18n(),
        ),
      ],
    );
  }
}
