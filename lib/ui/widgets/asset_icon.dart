import 'package:flutter/material.dart';

class AssetIcon extends StatelessWidget {
  final String name;
  final Color? color;
  final double? size;
  const AssetIcon({
    super.key,
    required this.name,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    return Image.asset(
      'assets/icons/$name.png',
      color: color ?? iconTheme.color,
      width: size ?? iconTheme.size,
      height: size ?? iconTheme.size,
    );
  }
}
