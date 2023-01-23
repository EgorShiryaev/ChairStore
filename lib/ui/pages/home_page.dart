import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';
import '../cubits/recommended_products_cubit.dart/recommended_products_cubit.dart';
import '../widgets/pages/home_page/home_page_body.dart';

class HomePage extends StatelessWidget {
  final void Function(int) selectNewIndex;

  const HomePage({
    super.key,
    required this.selectNewIndex,
  });

  static const tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecommendedProductsCibit>(
      create: (context) {
        return getIt<RecommendedProductsCibit>()..loadAll();
      },
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: HomePageBody(selectNewIndex: selectNewIndex),
        ),
      ),
    );
  }
}
