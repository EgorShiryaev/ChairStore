import 'package:chair_store/app_theme.dart';
import 'package:chair_store/ui/pages/login_page.dart';
import 'package:chair_store/ui/widgets/obscured_text_field.dart';
import 'package:flutter/material.dart';

import '../widgets/filled_button.dart';
import '../widgets/shaded_text_field.dart';
import '../widgets/text_button_with_icon.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const routeName = '/signUp';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
              Text('Sign up', style: Theme.of(context).textTheme.displayMedium),
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
              ObscuredTextField(
                controller: confirmPasswordController,
                label: 'Confirm password',
              ),
              const SizedBox(height: AppTheme.formElementsOffset),
              TextButtonWithIcon(
                text: 'Already have an account?',
                icon: Icons.arrow_right_alt,
                onPress: () {
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                },
              ),
              const SizedBox(height: AppTheme.formElementsOffset),
              FilledButton(
                label: 'Sign up',
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
