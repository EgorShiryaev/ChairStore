import 'package:flutter/material.dart';

class AssetIcon extends StatelessWidget {
  final String iconName;
  final Color? color;
  final double? size;
  const AssetIcon({
    super.key,
    required this.iconName,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    return Image.asset(
      'assets/icons/$iconName.png',
      color: color ?? iconTheme.color,
      width: size ?? iconTheme.size,
      height: size ?? iconTheme.size,
    );
  }
}
