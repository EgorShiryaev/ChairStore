import 'package:flutter/material.dart';

import '../../logic/models/navigation_tab_item.dart';
import '../widgets/shaded_navigation_panel/shaded_navigation_panel.dart';

class HomeTabsPage extends StatefulWidget {
  const HomeTabsPage({super.key});

  static const routeName = '/homeTabs';

  @override
  State<HomeTabsPage> createState() => _HomeTabsPageState();
}

class _HomeTabsPageState extends State<HomeTabsPage> {
  int selectedIndex = 0;

  void selectNewIndex(int newSelectedIndex) {
    setState(() {
      selectedIndex = newSelectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Home'),
      ),
      bottomNavigationBar: ShadedNavigationPanel(
        onSelect: selectNewIndex,
        selectedIndex: selectedIndex,
        tabs: [
          NavigationTabItem(iconName: 'home', label: 'Home'),
          NavigationTabItem(iconName: 'search', label: 'Search'),
          NavigationTabItem(iconName: 'cart', label: 'Cart'),
          NavigationTabItem(iconName: 'profile', label: 'Profile'),
        ],
      ),
    );
  }
}
