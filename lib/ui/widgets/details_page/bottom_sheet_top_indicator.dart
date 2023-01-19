import 'package:flutter/material.dart';

class BottomSheetTopIndicator extends StatelessWidget {
  const BottomSheetTopIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const SizedBox(height: 3, width: 50),
        ),
      ),
    );
  }
}
