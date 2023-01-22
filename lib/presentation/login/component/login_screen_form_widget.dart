import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/presentation/resource/component/form_error_widget.dart';
import 'package:store/presentation/resource/component/spacer_widget.dart';
import 'package:store/presentation/login/controller/login_screen_bloc.dart';

import '../../../core/i18n/app_string.dart';
import '../../../domain/entity/login_request.dart';
import '../../resource/component/password_text_field_widget.dart';
import '../../resource/component/text_field_widget.dart';
import '../../resource/size_manager.dart';

class LoginScreenFormWidget extends StatelessWidget {
  final LoginRequest loginRequest;
  final Map<String, String> validationErrors;
  final String serverError;

  LoginScreenFormWidget({
    Key? key,
    required this.loginRequest,
    required this.validationErrors,
    required this.serverError,
  }) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _initControllers() {
    _emailController.text = loginRequest.email;
    _passwordController.text = loginRequest.password;
  }

  @override
  Widget build(BuildContext context) {
    _initControllers();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: serverError.isNotEmpty,
          child: FormErrorWidget(message: serverError),
        ),
        SpacerWidget(
          height: AppSize.height0_03,
        ),
        TextFieldWidget(
          controller: _emailController,
          label: AppString.email.i18n(),
          error: validationErrors[AppString.email],
          textDirection: TextDirection.ltr,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email_outlined),
        ),
        SpacerWidget(
          height: AppSize.height0_03,
        ),
        PasswordTextFieldWidget(
          controller: _passwordController,
          label: AppString.password.i18n(),
          error: validationErrors[AppString.password],
        ),
        SpacerWidget(
          height: AppSize.height0_07,
        ),
        ElevatedButton(
          onPressed: () {
            _login(context);
          },
          child: Text(AppString.login.i18n()),
        ),
      ],
    );
  }

  /// login bottom on pressed
  void _login(BuildContext context) {
    final loginRequest = LoginRequest(
      email: _emailController.text,
      password: _passwordController.text,
    );

    BlocProvider.of<LoginScreenBloc>(context).add(LoginScreenLoginEvent(loginRequest));
  }
}
