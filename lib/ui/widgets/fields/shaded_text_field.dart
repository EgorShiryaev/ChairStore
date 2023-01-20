import 'package:flutter/material.dart';

import '../../themes/shaded_text_field_theme.dart';

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
    final shadedTextFieldTheme =
        Theme.of(context).extension<ShadedTextFieldTheme>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [shadedTextFieldTheme.boxShadow],
        color: Theme.of(context).colorScheme.surface,
        borderRadius: shadedTextFieldTheme.borderRadius,
      ),
      child: TextFormField(
        controller: controller,
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
