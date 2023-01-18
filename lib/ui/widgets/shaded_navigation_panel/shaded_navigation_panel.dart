import 'package:flutter/material.dart';

import '../../../logic/models/navigation_tab_item.dart';
import '../../../themes/shaded_navigation_panel_theme.dart';
import 'shaded_navigation_panel_item.dart';

class ShadedNavigationPanel extends StatelessWidget {
  final void Function(int) onSelect;
  final int selectedIndex;
  final List<NavigationTabItem> tabs;
  const ShadedNavigationPanel({
    super.key,
    required this.onSelect,
    required this.selectedIndex,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    final navigationBarTheme = NavigationBarTheme.of(context);
    final shadedNavigationPanelTheme =
        Theme.of(context).extension<ShadedNavigationPanelTheme>()!;
    return SafeArea(
      child: Container(
        height: navigationBarTheme.height,
        margin: shadedNavigationPanelTheme.margin,
        padding: shadedNavigationPanelTheme.padding,
        decoration: BoxDecoration(
          color: navigationBarTheme.backgroundColor,
          borderRadius: shadedNavigationPanelTheme.radius,
          boxShadow: [shadedNavigationPanelTheme.boxShadow],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            tabs.length,
            (index) {
              final tab = tabs[index];
              return ShadedNavigationPanelItem(
                assetIconName: tab.iconName,
                isSelected: index == selectedIndex,
                label: tab.label,
                onPress: () {
                  onSelect(index);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
