import 'package:flutter/material.dart';

class ModalAction extends StatelessWidget {
  final String text;
  final void Function() onPress;
  final bool? isNegative;

  const ModalAction({
    super.key,
    required this.text,
    required this.onPress,
    this.isNegative,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.bodyMedium;
    final colorScheme = Theme.of(context).colorScheme;
    return TextButton(
      onPressed: onPress,
      child: Text(
        text,
        style: textTheme!.copyWith(
          color:
              (isNegative ?? false) ? colorScheme.error : colorScheme.primary,
        ),
      ),
    );
  }
}
