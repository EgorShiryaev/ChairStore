import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';
import '../cubits/recommended_products_cubit.dart/recommended_products_cubit.dart';
import '../widgets/home_page/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecommendedProductsCibit>(
      create: (context) =>
          getIt<RecommendedProductsCibit>()..loadRecommendedProducts(),
      child: const Scaffold(
        body: SafeArea(
          bottom: false,
          child: HomePageBody(),
        ),
      ),
    );
  }
}
