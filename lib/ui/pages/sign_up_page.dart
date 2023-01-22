import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../themes/form_theme.dart';
import '../widgets/state_widgets/loading_mask.dart';
import '../widgets/modals/error_modal.dart';
import '../widgets/page_title.dart';
import '../widgets/pages/sign_up_page /sign_up_form.dart';
import 'home_tabs_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const routeName = '/signUp';

  void listener(BuildContext context, AuthState state) {
    if (state is SuccessAuthState) {
      Navigator.pushReplacementNamed(context, HomeTabsPage.routeName);
      Timer(const Duration(milliseconds: 750), FlutterNativeSplash.remove);
    } else if (state is ErrorAuthState) {
      ErrorModal.show(context, message: state.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formTheme = Theme.of(context).extension<FormTheme>()!;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: listener,
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              body: SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  padding: formTheme.padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PageTitle(title: 'Sign up'),
                      SizedBox(height: formTheme.paddingBetweenElements),
                      const SignUpForm()
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
