import 'package:flutter/material.dart';

import '../../themes/home_navigation_panel_theme.dart';

class HomeNavigationPanel extends StatefulWidget {
  final Function(int) onSelect;
  const HomeNavigationPanel({super.key, required this.onSelect});

  @override
  State<HomeNavigationPanel> createState() => _HomeNavigationPanelState();
}

class _HomeNavigationPanelState extends State<HomeNavigationPanel> {
  @override
  Widget build(BuildContext context) {
    final navigationBarTheme = NavigationBarTheme.of(context);
    final homeNavigationPanelTheme =
        Theme.of(context).extension<HomeNavigationPanelTheme>()!;
    return Padding(
      padding: homeNavigationPanelTheme.margin!,
      child: Material(
        borderRadius: homeNavigationPanelTheme.radius,
        elevation: homeNavigationPanelTheme.elevation!,
        child: Container(
          height: navigationBarTheme.height,
          padding: homeNavigationPanelTheme.padding,
          decoration: BoxDecoration(
            color: navigationBarTheme.backgroundColor,
            borderRadius: homeNavigationPanelTheme.radius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.home),
              Icon(Icons.search),
              Icon(Icons.shopping_cart),
              Icon(Icons.person)
            ],
          ),
        ),
      ),
    );
  }
}
