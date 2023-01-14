import 'package:chair_store/app_theme.dart';
import 'package:flutter/material.dart';

class ShadedTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  const ShadedTextField({
    super.key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: Theme.of(context).colorScheme.surface,
      borderRadius: AppTheme.fieldBorderRadius,
      child: TextFormField(
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          label: Text(label),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
