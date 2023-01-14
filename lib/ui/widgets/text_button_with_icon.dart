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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onPress,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(text),
                const SizedBox(width: 4),
                Icon(icon, color: Theme.of(context).colorScheme.tertiary)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
