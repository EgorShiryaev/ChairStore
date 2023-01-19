import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../themes/form_theme.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../pages/sign_up_page.dart';
import '../fields/obscured_text_field.dart';
import '../fields/shaded_text_field.dart';
import '../filled_button.dart';
import '../text_button_with_icon.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
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

  void login() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthCubit>(context).login(
        widget.emailController.text,
        widget.passwordController.text,
      );
    }
  }

  void navigateToSignUpPage() {
    Navigator.pushReplacementNamed(context, SignUpPage.routeName);
  }

  void submitEmailField(_) {
    FocusScope.of(context).autofocus(passwordFocusNode);
  }

  void submitPasswordField(_) {
    FocusScope.of(context).unfocus();
    login();
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
            controller: widget.emailController,
            focusNode: emailFocusNode,
            validator: emailValidator,
            submit: submitEmailField,
          ),
          SizedBox(height: formTheme.paddingBetweenElements),
          ObscuredTextField(
            label: 'Password',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            controller: widget.passwordController,
            focusNode: passwordFocusNode,
            validator: passwordValidator,
            submit: submitPasswordField,
          ),
          SizedBox(height: formTheme.paddingBetweenElements),
          TextButtonWithIcon(
            text: 'Don`t have an account?',
            icon: Icons.arrow_right_alt,
            onPress: navigateToSignUpPage,
          ),
          SizedBox(height: formTheme.paddingBetweenElements),
          FilledButton(
            label: 'Login',
            onPress: login,
          ),
        ],
      ),
    );
  }
}
