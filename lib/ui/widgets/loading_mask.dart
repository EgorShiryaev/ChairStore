import 'package:flutter/material.dart';

class LoadingMask extends StatelessWidget {
  const LoadingMask({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: ProgressIndicatorTheme.of(context).refreshBackgroundColor ??
            Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
