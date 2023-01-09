import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? error;

  const PasswordTextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.error,
  }) : super(key: key);

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool _securePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _securePassword,
      textDirection: TextDirection.ltr,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: widget.label,
        errorText: widget.error,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              _securePassword = !_securePassword;
            });
          },
          child:
              Icon(_securePassword ? Icons.visibility : Icons.visibility_off),
        ),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
