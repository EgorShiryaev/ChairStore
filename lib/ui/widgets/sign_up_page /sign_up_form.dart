import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../themes/form_theme.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../pages/login_page.dart';
import '../fields/obscured_text_field.dart';
import '../fields/shaded_text_field.dart';
import '../filled_button.dart';
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
    final passwordIsMatch = currentValue == passwordController.text;
    if (currentValue.isEmpty) {
      return 'Please enter your password';
    } else if (!passwordIsMatch) {
      return 'Passwords do not match';
    }
    return null;
  }

  void signUp() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthCubit>(context).signUp(
        emailController.text,
        passwordController.text,
      );
    }
  }

  void navigateToLoginPage() {
    Navigator.pushReplacementNamed(context, LoginPage.routeName);
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
    final formTheme = Theme.of(context).extension<FormTheme>()!;
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
          SizedBox(height: formTheme.paddingBetweenElements),
          ObscuredTextField(
            label: 'Password',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            controller: passwordController,
            focusNode: passwordFocusNode,
            validator: passwordValidator,
            submit: submitPasswordField,
          ),
          SizedBox(height: formTheme.paddingBetweenElements),
          ObscuredTextField(
            label: 'Confirm password',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            controller: confirmPasswordController,
            focusNode: confirmPasswordFocusNode,
            validator: confirmPasswordValidator,
            submit: submitConfirmPasswordField,
          ),
          SizedBox(height: formTheme.paddingBetweenElements),
          TextButtonWithIcon(
            text: 'Already have an account?',
            icon: Icons.arrow_right_alt,
            onPress: navigateToLoginPage,
          ),
          SizedBox(height: formTheme.paddingBetweenElements),
          FilledButton(
            label: 'Sign up',
            onPress: signUp,
          ),
        ],
      ),
    );
  }
}
