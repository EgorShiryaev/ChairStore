import 'package:flutter/material.dart';

import '../themes/grdient_button_theme.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final Function() onPress;
  const GradientButton({
    super.key,
    required this.label,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final filledButtonTheme =
        Theme.of(context).extension<GradientButtonTheme>()!;
    return Container(
      height: filledButtonTheme.height,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: filledButtonTheme.borderRadius,
        gradient: filledButtonTheme.backgroundGradient,
        boxShadow: [filledButtonTheme.boxShadow],
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
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
