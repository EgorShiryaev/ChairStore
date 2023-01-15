import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../widgets/page_title.dart';
import '../widgets/sign_up_page /sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const routeName = '/signUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppTheme.listViewPadding,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PageTitle(title: 'Sign up'),
              SizedBox(height: AppTheme.formElementsOffset),
              SignUpForm()
            ],
          ),
        ),
      ),
    );
  }
}
