import 'package:flutter/material.dart';

import '../../themes/page_theme.dart';
import '../remote_asset.dart';

class ProductImage extends StatelessWidget {
  final String url;
  final BoxConstraints constraints;
  const ProductImage({
    super.key,
    required this.url,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final pageTheme = Theme.of(context).extension<PageTheme>()!;
    return Padding(
      padding: pageTheme.padding,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: constraints,
          child: RemoteAsset(imagePath: url),
        ),
      ),
    );
  }
}
