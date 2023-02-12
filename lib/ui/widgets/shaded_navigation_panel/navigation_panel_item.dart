import 'package:flutter/material.dart';

import '../../themes/shaded_navigation_panel_theme.dart';
import '../asset_icon.dart';

class NavigationPanelItem extends StatelessWidget {
  final bool isSelected;
  final void Function() onPress;
  final String assetIconName;
  final String label;

  const NavigationPanelItem({
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
      child: Container(
        padding:
            isSelected ? shadedNavigationPanelTheme.itemContentPadding : null,
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: shadedNavigationPanelTheme.itemBorderRadius,
                gradient: selectedItemTheme.backgroundGradient,
              )
            : BoxDecoration(
                borderRadius: shadedNavigationPanelTheme.itemBorderRadius,
              ),
        child: isSelected
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AssetIcon(
                    iconName: assetIconName,
                    color: selectedItemTheme.contentColor,
                  ),
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
              )
            : DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: shadedNavigationPanelTheme.itemBorderRadius,
                ),
                child: RawMaterialButton(
                  constraints: const BoxConstraints.tightFor(
                    height: 40,
                    width: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: onPress,
                  child: AssetIcon(
                    iconName: assetIconName,
                    color: unselectedItemTheme.contentColor,
                  ),
                ),
              ),
      ),
    );
  }
}
