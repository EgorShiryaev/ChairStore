import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../themes/form_theme.dart';
import '../../themes/list_view_theme.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/auth_cubit/auth_state.dart';
import '../widgets/loading_mask.dart';
import '../widgets/login_page/login_form.dart';
import '../widgets/modals/error_modal.dart';
import '../widgets/page_title.dart';
import 'home_tabs_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final formTheme = Theme.of(context).extension<FormTheme>()!;
    final listViewTheme = Theme.of(context).extension<ListViewTheme>()!;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuthState) {
          Navigator.pushReplacementNamed(context, HomeTabsPage.routeName);
        } else if (state is ErrorAuthState) {
          ErrorModal.show(context, message: state.message);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              body: SingleChildScrollView(
                padding: listViewTheme.padding,
                child: SafeArea(
                  child: Padding(
                    padding: formTheme.padding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PageTitle(title: 'Login'),
                        SizedBox(
                          height: formTheme.paddingBetweenElements,
                        ),
                        const LoginForm(),
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
