import 'package:flutter/material.dart';

import 'shaded_text_field.dart';

class ObscuredTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function(String?)? submit;
  final FocusNode? focusNode;

  const ObscuredTextField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType,
    this.validator,
    this.textInputAction,
    this.submit,
    this.focusNode,
  });

  @override
  State<ObscuredTextField> createState() => _ObscuredTextFieldState();
}

class _ObscuredTextFieldState extends State<ObscuredTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return ShadedTextField(
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: obscureText,
      label: widget.label,
      submit: widget.submit,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      suffixIcon: IconButton(
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
    );
  }
}
