import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../widgets/login_page/login_form.dart';
import '../widgets/page_title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppTheme.listViewPadding,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PageTitle(title: 'Login'),
              SizedBox(height: AppTheme.formElementsOffset),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
