import 'package:chair_store/app_theme.dart';
import 'package:flutter/material.dart';

class ShadedTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function(String?)? submit;
  final FocusNode? focusNode;

  const ShadedTextField({
    super.key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.obscureText,
    this.keyboardType,
    this.validator,
    this.textInputAction,
    this.submit,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppTheme.elevation,
      color: Theme.of(context).colorScheme.surface,
      borderRadius: AppTheme.borderRadius,
      child: TextFormField(
        focusNode: focusNode,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        validator: validator,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: suffixIcon,
        ),
        onFieldSubmitted: submit,
      ),
    );
  }
}
