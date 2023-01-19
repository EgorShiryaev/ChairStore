import 'package:flutter/material.dart';

import '../../themes/shaded_navigation_panel_theme.dart';

class ShadedNavigationPanelSelectedItem extends StatelessWidget {
  final Widget icon;
  final String label;
  const ShadedNavigationPanelSelectedItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final shadedNavigationPanelTheme =
        Theme.of(context).extension<ShadedNavigationPanelTheme>()!;
    final selectedItemTheme = shadedNavigationPanelTheme.selectedItemTheme;

    return Container(
      padding: shadedNavigationPanelTheme.itemContentPadding,
      decoration: BoxDecoration(
        gradient: selectedItemTheme.backgroundGradient,
        borderRadius: shadedNavigationPanelTheme.itemBorderRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(
            width: selectedItemTheme.paddingBetweenIconAndLabel,
          ),
          Text(
            label,
            style: selectedItemTheme.labelStyle.copyWith(
              color: selectedItemTheme.contentColor,
            ),
          )
        ],
      ),
    );
  }
}
