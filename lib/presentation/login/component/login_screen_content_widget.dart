import 'package:flutter/material.dart';
import 'package:store/presentation/login/component/login_screen_form_widget.dart';

import '../../../domain/entity/login_request.dart';
import '../../resource/component/spacer_widget.dart';
import '../../resource/size_manager.dart';
import 'login_screen_register_widget.dart';

class LoginScreenContentWidget extends StatelessWidget {
  final LoginRequest loginRequest;
  final Map<String, String> validationErrors;
  final String serverError;

  const LoginScreenContentWidget({
    Key? key,
    required this.loginRequest,
    required this.validationErrors,
    required this.serverError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoginScreenFormWidget(
              loginRequest: loginRequest,
              validationErrors: validationErrors,
              serverError: serverError),
          SpacerWidget(
            height: AppSize.height0_05,
          ),
          const LoginScreenRegisterWidget(),
        ],
      ),
    );
  }
}
