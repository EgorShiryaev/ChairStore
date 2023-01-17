import 'package:flutter/material.dart';

import '../widgets/home_navigation_panel.dart';

class HomeTabsPage extends StatefulWidget {
  const HomeTabsPage({super.key});

  static const routeName = '/homeTabs';

  @override
  State<HomeTabsPage> createState() => _HomeTabsPageState();
}

class _HomeTabsPageState extends State<HomeTabsPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Scaffold(
          body: Center(
            child: Text('Home'),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: HomeNavigationPanel(
              onSelect: (int) {},
            ),
          ),
        ),
      ],
    );
  }
}
