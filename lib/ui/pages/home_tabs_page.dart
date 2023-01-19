import 'package:chair_store/ui/pages/profile_page.dart';
import 'package:flutter/material.dart';

import '../../logic/models/navigation_tab_item.dart';
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
            Center(child: Text('Catalog')),
            Center(child: Text('Cart')),
            ProfilePage(),
          ],
          selectedIndex: selectedIndex,
        ),
        ShadedNavigationPanel(
          onSelect: selectNewIndex,
          selectedIndex: selectedIndex,
          tabs: [
            NavigationTabItem(iconName: 'home', label: 'Home'),
            NavigationTabItem(iconName: 'catalog', label: 'Catalog'),
            NavigationTabItem(iconName: 'cart', label: 'Cart'),
            NavigationTabItem(iconName: 'profile', label: 'Profile'),
          ],
        ),
      ],
    );
  }
}
