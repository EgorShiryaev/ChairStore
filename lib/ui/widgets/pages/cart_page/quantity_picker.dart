import 'package:flutter/material.dart';

class QuantityPicker extends StatelessWidget {
  final int quantity;
  final void Function() increment;
  final void Function() decrement;

  const QuantityPicker({
    super.key,
    required this.quantity,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_up_rounded),
          onPressed: quantity < 10 ? increment : null,
        ),
        Text(
          '$quantity',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          onPressed: quantity > 1 ? decrement : null,
        ),
      ],
    );
  }
}
