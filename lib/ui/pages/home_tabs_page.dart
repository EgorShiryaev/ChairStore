import 'package:flutter/material.dart';

class HomeTabsPage extends StatelessWidget {
  const HomeTabsPage({super.key});

   static const routeName = '/homeTabs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
