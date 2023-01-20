import 'package:flutter/material.dart';

import '../../themes/shaded_navigation_panel_theme.dart';
import '../asset_icon.dart';
import 'shaded_navigation_panel_selected_item.dart';
import 'shaded_navigation_panel_unselected_item.dart';

class ShadedNavigationPanelItem extends StatelessWidget {
  final bool isSelected;
  final void Function() onPress;
  final String assetIconName;
  final String label;

  const ShadedNavigationPanelItem({
    super.key,
    required this.isSelected,
    required this.onPress,
    required this.label,
    required this.assetIconName,
  });

  @override
  Widget build(BuildContext context) {
    final shadedNavigationPanelTheme =
        Theme.of(context).extension<ShadedNavigationPanelTheme>()!;
    final selectedItemTheme = shadedNavigationPanelTheme.selectedItemTheme;
    final unselectedItemTheme = shadedNavigationPanelTheme.unselectedItemTheme;

    return Material(
      color: shadedNavigationPanelTheme.backgroundColor,
      child: GestureDetector(
        onTap: onPress,
        child: isSelected
            ? ShadedNavigationPanelSelectedItem(
                icon: AssetIcon(
                  iconName: assetIconName,
                  color: selectedItemTheme.contentColor,
                ),
                label: label,
              )
            : ShadedNavigationPanelUnselectedItem(
                icon: AssetIcon(
                  iconName: assetIconName,
                  color: unselectedItemTheme.contentColor,
                ),
              ),
      ),
    );
  }
}
