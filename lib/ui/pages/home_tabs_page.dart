import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/models/navigation_tab_item.dart';
import '../cubits/cart_cubit/cart_cubit.dart';
import '../widgets/shaded_navigation_panel/shaded_navigation_panel.dart';
import '../widgets/tab_pages_container.dart';
import 'cart_page.dart';
import 'catalog_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

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
  void initState() {
    BlocProvider.of<CartCubit>(context).loadAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TabPagesContainer(
          pages: [
            HomePage(selectNewIndex: selectNewIndex),
            CatalogPage(selectNewIndex: selectNewIndex),
            const CartPage(),
            const ProfilePage(),
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
