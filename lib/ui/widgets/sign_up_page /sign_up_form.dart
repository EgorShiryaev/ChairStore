import 'package:flutter/material.dart';

import '../../../app_theme.dart';
import '../../pages/sign_up_page.dart';
import '../filled_button.dart';
import '../fields/obscured_text_field.dart';
import '../fields/shaded_text_field.dart';
import '../text_button_with_icon.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  String? emailValidator(String? value) {
    final currentValue = value ?? '';
    if (currentValue.isEmpty) {
      return 'Please enter your email';
    }
    if (!currentValue.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    final currentValue = value ?? '';
    if (currentValue.isEmpty) {
      return 'Please enter your password';
    } else if (currentValue.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    final currentValue = value ?? '';
    if (currentValue.isEmpty) {
      return 'Please enter your password';
    } else if (currentValue != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void signUp() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  void navigateToLoginPage() {
    Navigator.pushReplacementNamed(context, SignUpPage.routeName);
  }

  void submitEmailField(_) {
    FocusScope.of(context).requestFocus(passwordFocusNode);
  }

  void submitPasswordField(_) {
    FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
  }

  void submitConfirmPasswordField(_) {
    FocusScope.of(context).unfocus();
    signUp();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ShadedTextField(
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: emailController,
            focusNode: emailFocusNode,
            validator: emailValidator,
            submit: submitEmailField,
          ),
          const SizedBox(height: AppTheme.formElementsOffset),
          ObscuredTextField(
            label: 'Password',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            controller: passwordController,
            focusNode: passwordFocusNode,
            validator: passwordValidator,
            submit: submitPasswordField,
          ),
          const SizedBox(height: AppTheme.formElementsOffset),
          ObscuredTextField(
            label: 'Confirm password',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            controller: confirmPasswordController,
            focusNode: confirmPasswordFocusNode,
            validator: confirmPasswordValidator,
            submit: submitConfirmPasswordField,
          ),
          const SizedBox(height: AppTheme.formElementsOffset),
          TextButtonWithIcon(
            text: 'Already have an account?',
            icon: Icons.arrow_right_alt,
            onPress: navigateToLoginPage,
          ),
          const SizedBox(height: AppTheme.formElementsOffset),
          FilledButton(
            label: 'Sign up',
            onPress: signUp,
          ),
          const SizedBox(height: AppTheme.formElementsOffset),
        ],
      ),
    );
  }
}
