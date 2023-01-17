import 'package:flutter/material.dart';
import 'package:store/presentation/register/component/register_screen_form_widget.dart';

import '../../../domain/entity/register_request.dart';
import '../../common/spacer_widget.dart';
import '../../resource/size_manager.dart';
import 'register_screen_login_widget.dart';

class RegisterScreenContentWidget extends StatelessWidget {
  final RegisterRequest registerRequest;
  final Map<String, String> validationErrors;
  final String serverError;

  const RegisterScreenContentWidget({
    Key? key,
    required this.registerRequest,
    required this.validationErrors,
    required this.serverError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RegisterScreenFormWidget(
              registerRequest: registerRequest,
              validationErrors: validationErrors,
              serverError: serverError),
          SpacerWidget(
            height: AppSize.height0_05,
          ),
          const RegisterScreenLoginWidget(),
        ],
      ),
    );
  }
}
