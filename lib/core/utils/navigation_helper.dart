import 'package:flutter/material.dart';

import '../../ui/pages/home_tabs_page.dart';
import '../../ui/pages/login_page.dart';

class NavigationHelper {
  static void _clearStackAndPushName(BuildContext context, String name) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      name,
      (_) => false,
    );
  }

  static void replacementToHomeTabPage(BuildContext context) {
    _clearStackAndPushName(context, HomeTabsPage.routeName);
  }

  static void replacementToLoginPage(BuildContext context) {
    _clearStackAndPushName(context, LoginPage.routeName);
  }
}
