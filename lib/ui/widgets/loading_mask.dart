import 'package:flutter/material.dart';

class LoadingMask extends StatelessWidget {
  const LoadingMask({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color:
            Theme.of(context).progressIndicatorTheme.refreshBackgroundColor ??
                Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
