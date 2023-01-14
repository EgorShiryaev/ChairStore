import 'package:chair_store/ui/widgets/shaded_text_field.dart';
import 'package:flutter/material.dart';

class ObscuredTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const ObscuredTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  State<ObscuredTextField> createState() => _ObscuredTextFieldState();
}

class _ObscuredTextFieldState extends State<ObscuredTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return ShadedTextField(
      controller: widget.controller,
      obscureText: obscureText,
      label: widget.label,
      suffixIcon: IconButton(
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: () => setState(
          () => obscureText = !obscureText,
        ),
      ),
    );
  }
}
