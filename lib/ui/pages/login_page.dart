import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_theme.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../widgets/loading_mask.dart';
import '../widgets/login_page/login_form.dart';
import '../widgets/page_title.dart';
import 'home_tabs_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          unawaited(
            Navigator.pushReplacementNamed(context, HomeTabsPage.routeName),
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
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
            ),
            if (state is LoadingAuthState) const LoadingMask()
          ],
        );
      },
    );
  }
}
