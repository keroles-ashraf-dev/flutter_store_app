import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:store/presentation/resource/component/form_error_widget.dart';
import 'package:store/presentation/resource/component/spacer_widget.dart';
import 'package:store/presentation/resource/component/text_field_widget.dart';
import 'package:store/presentation/register/controller/register_screen_bloc.dart';

import '../../../core/i18n/app_string.dart';
import '../../../domain/entity/register_request.dart';
import '../../resource/component/password_text_field_widget.dart';
import '../../resource/size_manager.dart';

class RegisterScreenFormWidget extends StatelessWidget {
  final RegisterRequest registerRequest;
  final Map<String, String> validationErrors;
  final String serverError;

  RegisterScreenFormWidget({
    Key? key,
    required this.registerRequest,
    required this.validationErrors,
    required this.serverError,
  }) : super(key: key);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _initControllers() {
    _firstNameController.text = registerRequest.firstName;
    _lastNameController.text = registerRequest.lastName;
    _emailController.text = registerRequest.email;
    _phoneController.text = registerRequest.phone;
    _passwordController.text = registerRequest.password;
    _confirmPasswordController.text = registerRequest.confirmPassword;
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
          controller: _firstNameController,
          label: AppString.firstName.i18n(),
          error: validationErrors[AppString.firstName],
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.person_outline),
        ),
        SpacerWidget(
          height: AppSize.height0_03,
        ),
        TextFieldWidget(
          controller: _lastNameController,
          label: AppString.lastName.i18n(),
          error: validationErrors[AppString.lastName],
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.person_outline),
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
        TextField(
          controller: _phoneController,
          textDirection: TextDirection.ltr,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: AppString.phone.i18n(),
            errorText: validationErrors[AppString.phone],
            prefixIcon: const Icon(Icons.phone_android_outlined),
          ).applyDefaults(Theme.of(context).inputDecorationTheme),
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
          height: AppSize.height0_03,
        ),
        PasswordTextFieldWidget(
          controller: _confirmPasswordController,
          label: AppString.confirmPassword.i18n(),
          error: validationErrors[AppString.confirmPassword],
        ),
        SpacerWidget(
          height: AppSize.height0_07,
        ),
        ElevatedButton(
          onPressed: () {
            _register(context);
          },
          child: Text(AppString.register.i18n()),
        ),
      ],
    );
  }

  /// register bottom on pressed
  void _register(BuildContext context) {
    final registerRequest = RegisterRequest(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );

    BlocProvider.of<RegisterScreenBloc>(context)
        .add(RegisterScreenRegisterEvent(registerRequest));
  }
}
