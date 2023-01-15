import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_theme.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../widgets/loading_mask.dart';
import '../widgets/page_title.dart';
import '../widgets/sign_up_page /sign_up_form.dart';
import 'home_tabs_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const routeName = '/signUp';

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
                      PageTitle(title: 'Sign up'),
                      SizedBox(height: AppTheme.formElementsOffset),
                      SignUpForm()
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
