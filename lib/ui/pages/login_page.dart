import 'package:chair_store/app_theme.dart';
import 'package:chair_store/ui/pages/sign_up_page.dart';
import 'package:chair_store/ui/widgets/obscured_text_field.dart';
import 'package:flutter/material.dart';

import '../widgets/filled_button.dart';
import '../widgets/shaded_text_field.dart';
import '../widgets/text_button_with_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppTheme.listViewPadding,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Login', style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: AppTheme.formElementsOffset),
              ShadedTextField(
                label: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: AppTheme.formElementsOffset),
              ObscuredTextField(
                controller: passwordController,
                label: 'Password',
              ),
              const SizedBox(height: AppTheme.formElementsOffset),
              TextButtonWithIcon(
                text: 'Don`t have an account?',
                icon: Icons.arrow_right_alt,
                onPress: () {
                  Navigator.pushReplacementNamed(context, SignUpPage.routeName);
                },
              ),
              const SizedBox(height: AppTheme.formElementsOffset),
              FilledButton(
                label: 'Login',
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
