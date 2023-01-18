import 'package:chair_store/ui/widgets/shaded_navigation_panel/shaded_navigation_panel_selected_item.dart';
import 'package:chair_store/ui/widgets/shaded_navigation_panel/shaded_navigation_panel_unselected_item.dart';
import 'package:flutter/material.dart';

import '../../../themes/shaded_navigation_panel_theme.dart';
import '../asset_icon.dart';

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
      child: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: onPress,
        child: isSelected
            ? ShadedNavigationPanelSelectedItem(
                icon: AssetIcon(
                  name: assetIconName,
                  color: selectedItemTheme.contentColor,
                ),
                label: label,
              )
            : ShadedNavigationPanelUnselectedItem(
                icon: AssetIcon(
                  name: assetIconName,
                  color: unselectedItemTheme.contentColor,
                ),
              ),
      ),
    );
  }
}
