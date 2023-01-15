import 'package:flutter/material.dart';

class TextButtonWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPress;
  const TextButtonWithIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text),
            const SizedBox(width: 4),
            Icon(icon, color: Theme.of(context).colorScheme.tertiary)
          ],
        ),
      ),
    );
  }
}
