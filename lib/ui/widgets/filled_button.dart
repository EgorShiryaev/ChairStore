import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../app_theme.dart';

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
    return InkWell(
      splashColor: Theme.of(context).colorScheme.onTertiary,
      borderRadius: AppTheme.filledButtonBorderRadius,
      onTap: onPress,
      child: Container(
        height: 44,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: AppTheme.filledButtonBorderRadius,
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
            style: AppTheme.filledButtonTexStyle,
          ),
        ),
      ),
    );
  }
}
