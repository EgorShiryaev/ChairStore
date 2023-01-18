import 'package:flutter/material.dart';

import '../../../themes/shaded_navigation_panel_theme.dart';

class ShadedNavigationPanelUnselectedItem extends StatelessWidget {
  final Widget icon;
  const ShadedNavigationPanelUnselectedItem({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final shadedNavigationPanelTheme =
        Theme.of(context).extension<ShadedNavigationPanelTheme>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: shadedNavigationPanelTheme.itemBorderRadius,
        color: shadedNavigationPanelTheme.backgroundColor,
      ),
      child: Padding(
        padding: shadedNavigationPanelTheme.itemContentPadding,
        child: icon,
      ),
    );
  }
}
