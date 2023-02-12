import 'package:flutter/material.dart';

import '../../themes/page_theme.dart';
import '../filled_button.dart';

class ErrorMask extends StatelessWidget {
  final String message;
  final void Function() retry;

  const ErrorMask({
    super.key,
    required this.message,
    required this.retry,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.background;
    final pageTheme = Theme.of(context).extension<PageTheme>()!;
    return ColoredBox(
      color: backgroundColor,
      child: Padding(
        padding: pageTheme.padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: pageTheme.paddingBetweenElements,
            ),
            GradientButton(label: 'Retry', onPress: retry)
          ],
        ),
      ),
    );
  }
}
