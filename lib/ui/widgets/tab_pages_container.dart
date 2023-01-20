import 'package:flutter/material.dart';

class TabPagesContainer extends StatelessWidget {
  final List<Widget> pages;
  final int selectedIndex;
  const TabPagesContainer({
    super.key,
    required this.pages,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
    );
  }
}
