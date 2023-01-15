import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_theme.dart';
import 'dependency_injection.dart';
import 'ui/cubits/auth_cubit/auth_cubit.dart';
import 'ui/pages/home_tabs_page.dart';
import 'ui/pages/login_page.dart';
import 'ui/pages/sign_up_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => getIt<AuthCubit>(),
        )
      ],
      child: MaterialApp(
        title: 'Chair store',
        initialRoute: SignUpPage.routeName,
        routes: {
          SignUpPage.routeName: (context) => const SignUpPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          HomeTabsPage.routeName: (context) => const HomeTabsPage(),
        },
        theme: AppTheme.theme,
      ),
    );
  }
}
