import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency_injection.dart';
import 'ui/cubits/auth_cubit/auth_cubit.dart';
import 'ui/cubits/cart_cubit/cart_cubit.dart';
import 'ui/cubits/order_history_cubit/order_history_cubit.dart';
import 'ui/pages/details_page.dart';
import 'ui/pages/home_tabs_page.dart';
import 'ui/pages/login_page.dart';
import 'ui/pages/order_history_page.dart';
import 'ui/pages/order_page.dart';
import 'ui/pages/sign_up_page.dart';
import 'ui/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => getIt<AuthCubit>()..updateAuthSession(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => getIt<CartCubit>(),
        ),
        BlocProvider<OrderHistoryCubit>(
          create: (context) => getIt<OrderHistoryCubit>(),
        )
      ],
      child: MaterialApp(
        title: 'ChairStore',
        initialRoute: LoginPage.routeName,
        routes: {
          SignUpPage.routeName: (context) => const SignUpPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          HomeTabsPage.routeName: (context) => const HomeTabsPage(),
          DetailsPage.routeName: (context) => const DetailsPage(),
          OrderPage.routeName: (context) => const OrderPage(),
          OrderHistoryPage.routeName: (context) => const OrderHistoryPage()
        },
        theme: AppTheme.theme,
      ),
    );
  }
}
