import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';
import '../cubits/catalog_cubit.dart/catalog_cubit.dart';
import '../widgets/pages/catalog_page/app_bar_catalog_page.dart';
import '../widgets/pages/catalog_page/catalog_page_body.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height =
        (AppBarTheme.of(context).toolbarHeight ?? kToolbarHeight) + 8;
    return BlocProvider<CatalogCubit>(
      create: (context) {
        return getIt<CatalogCubit>()..loadAll();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height),
          child: const AppBarCatalogPage(),
        ),
        body: const SafeArea(
          bottom: false,
          child: CatalogPageBody(),
        ),
      ),
    );
  }
}
