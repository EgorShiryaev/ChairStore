import 'package:flutter/material.dart';

import '../../logic/models/navigation_tab_item.dart';
import '../../themes/list_view_theme.dart';
import '../widgets/shaded_navigation_panel/shaded_navigation_panel.dart';
import '../widgets/tab_pages_container.dart';
import 'home_page.dart';

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
    return Stack(
      children: [
        TabPagesContainer(
          pages: const [
            HomePage(),
            Center(child: Text('Search')),
            Center(child: Text('Cart')),
            Center(child: Text('Profile')),
          ],
          selectedIndex: selectedIndex,
        ),
        ShadedNavigationPanel(
          onSelect: selectNewIndex,
          selectedIndex: selectedIndex,
          tabs: [
            NavigationTabItem(iconName: 'home', label: 'Home'),
            NavigationTabItem(iconName: 'search', label: 'Search'),
            NavigationTabItem(iconName: 'cart', label: 'Cart'),
            NavigationTabItem(iconName: 'profile', label: 'Profile'),
          ],
        ),
      ],
    );
  }
}
