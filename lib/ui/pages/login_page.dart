import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../themes/form_theme.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../widgets/loading_mask.dart';
import '../widgets/login_page/login_form.dart';
import '../widgets/modals/error_modal.dart';
import '../widgets/page_title.dart';
import 'home_tabs_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formTheme = Theme.of(context).extension<FormTheme>()!;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          Navigator.pushReplacementNamed(context, HomeTabsPage.routeName);
          Timer(const Duration(milliseconds: 750), FlutterNativeSplash.remove);
        } else if (state is ErrorAuthState) {
          ErrorModal.show(context, message: state.message);
          if (state.email != null) {
            emailController.text = state.email!;
          }
          if (state.password != null) {
            passwordController.text = state.password!;
          }
        }

        if (state is ErrorAuthState || state is UnAuthState) {
          Timer(const Duration(milliseconds: 750), FlutterNativeSplash.remove);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              body: SafeArea(
                bottom: false,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    padding: formTheme.padding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PageTitle(title: 'Login'),
                        SizedBox(
                          height: formTheme.paddingBetweenElements,
                        ),
                        LoginForm(
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (state is LoadingAuthState) const LoadingMask()
          ],
        );
      },
    );
  }
}
