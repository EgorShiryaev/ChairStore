import 'package:flutter/material.dart';

import '../../themes/filled_button_theme.dart';

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
    return Material(
      elevation: filledButtonTheme.elevation!,
      borderRadius: filledButtonTheme.borderRadius,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.onTertiary,
        borderRadius: filledButtonTheme.borderRadius,
        onTap: onPress,
        child: Container(
          height: 44,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: filledButtonTheme.borderRadius,
            gradient: const LinearGradient(
              colors: [
                Color(0xffA95EFA),
                Color(0xff8A49F7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Text(
              label.toUpperCase(),
              style: filledButtonTheme.labelStyle,
            ),
          ),
        ),
      ),
    );
  }
}
