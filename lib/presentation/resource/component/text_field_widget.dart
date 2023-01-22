import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? error;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    this.error,
    this.keyboardType,
    this.textDirection,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textDirection: textDirection,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        errorText: error,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
