import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/models/page_arguments/details_page_arguments.dart';
import '../../../../logic/models/product.dart';
import '../../../cubits/catalog_cubit.dart/catalog_cubit.dart';
import '../../../cubits/catalog_cubit.dart/catalog_state.dart';
import '../../../pages/cart_page.dart';
import '../../../pages/details_page.dart';
import '../../product_widgets/product_wrap_title.dart';
import '../../product_widgets/products_wrap.dart';
import '../../state_widgets/error_mask.dart';
import '../../state_widgets/loading_mask.dart';

class CatalogPageBody extends StatefulWidget {
  final void Function(int) selectNewIndex;
  const CatalogPageBody({super.key, required this.selectNewIndex});

  @override
  State<CatalogPageBody> createState() => _CatalogPageBodyState();
}

class _CatalogPageBodyState extends State<CatalogPageBody> {
  void retryLoad() {
    BlocProvider.of<CatalogCubit>(context).loadAll();
  }

  Future<void> refresh() {
    return BlocProvider.of<CatalogCubit>(context).refresh();
  }

  void navigateToDetailsPage(Product product) {
    Navigator.pushNamed(
      context,
      DetailsPage.routeName,
      arguments: DetailsPageArguments(product: product),
    ).then((value) {
      if (value == true) {
        widget.selectNewIndex(CartPage.tabIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogCubit, CatalogState>(
      builder: (context, state) {
        if (state is LoadingCatalogState) {
          return const LoadingMask();
        } else if (state is ErrorCatalogState) {
          return ErrorMask(
            message: state.message,
            retry: retryLoad,
          );
        } else if (state is LoadedCatalogState ||
            state is FoundedCatalogState) {
          var products = <Product>[];

          if (state is LoadedCatalogState) {
            products = [...state.products];
          } else if (state is FoundedCatalogState) {
            products = [...state.products];
          }

          return RefreshIndicator(
            onRefresh: refresh,
            child: CustomScrollView(
              slivers: [
                if (state is FoundedCatalogState)
                  ProductWrapTitle(
                    title: 'Found ${state.products.length} results',
                  ),
                ProductsWrap(
                  products: products,
                  onPress: navigateToDetailsPage,
                ),
              ],
            ),
          );
        }
        return ErrorMask(
          message: 'Unknowed state',
          retry: retryLoad,
        );
      },
    );
  }
}
