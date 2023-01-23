import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/catalog_cubit.dart/catalog_cubit.dart';
import 'search_field.dart';

class AppBarCatalogPage extends StatefulWidget {
  const AppBarCatalogPage({super.key});

  @override
  State<AppBarCatalogPage> createState() => _AppBarCatalogPageState();
}

class _AppBarCatalogPageState extends State<AppBarCatalogPage> {
  final controller = TextEditingController();

  void clear() {
    BlocProvider.of<CatalogCubit>(context).search('');
    controller.clear();
  }

  void changeSearchText(String newText) {
    BlocProvider.of<CatalogCubit>(context).search(newText);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SearchField(
        clear: clear,
        controller: controller,
        onChanged: changeSearchText,
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(8),
        child: SizedBox(),
      ),
      shape: const Border(
        bottom: BorderSide(
          color: Color(0xffF3F6F8),
          width: 1,
        ),
      ),
    );
  }
}
