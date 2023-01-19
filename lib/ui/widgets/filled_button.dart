import 'package:flutter/material.dart';

import '../themes/filled_button_theme.dart';

class FilledButton extends StatelessWidget {
  final String label;
  final Function() onPress;
  const FilledButton({
    super.key,
    required this.label,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final filledButtonTheme = Theme.of(context).extension<FilledButtonTheme>()!;
    return InkWell(
      onTap: onPress,
      child: Container(
        height: filledButtonTheme.height,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: filledButtonTheme.borderRadius,
          gradient: filledButtonTheme.backgroundGradient,
          boxShadow: [filledButtonTheme.boxShadow],
        ),
        child: Center(
          child: Text(
            label.toUpperCase(),
            style: filledButtonTheme.labelStyle,
          ),
        ),
      ),
    );
  }
}
