import 'package:chair_store/app_theme.dart';
import 'package:chair_store/ui/pages/login_page.dart';
import 'package:chair_store/ui/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chair store',
      initialRoute: LoginPage.routeName,
      routes: {
        SignUpPage.routeName: (context) => const SignUpPage(),
        LoginPage.routeName: (context) => const LoginPage()
      },
      theme: AppTheme.theme,
    );
  }
}
