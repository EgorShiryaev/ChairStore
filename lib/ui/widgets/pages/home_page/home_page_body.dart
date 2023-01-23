import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/models/page_arguments/details_page_arguments.dart';
import '../../../../logic/models/product.dart';
import '../../../cubits/recommended_products_cubit.dart/recommended_products_cubit.dart';
import '../../../cubits/recommended_products_cubit.dart/recommended_products_state.dart';
import '../../../pages/cart_page.dart';
import '../../../pages/details_page.dart';
import '../../product_widgets/product_wrap_title.dart';
import '../../product_widgets/products_wrap.dart';
import '../../state_widgets/error_mask.dart';
import '../../state_widgets/loading_mask.dart';

class HomePageBody extends StatefulWidget {
  final void Function(int) selectNewIndex;
  const HomePageBody({super.key, required this.selectNewIndex});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  void retryLoad() {
    BlocProvider.of<RecommendedProductsCibit>(context).loadAll();
  }

  Future<void> refresh() {
    return BlocProvider.of<RecommendedProductsCibit>(context).refresh();
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
    return BlocBuilder<RecommendedProductsCibit, RecommendedProductsState>(
      builder: (context, state) {
        if (state is LoadingRecommendedProductsState) {
          return const LoadingMask();
        } else if (state is ErrorRecommendedProductsState) {
          return ErrorMask(
            message: state.message,
            retry: retryLoad,
          );
        } else if (state is LoadedRecommendedProductsState) {
          return RefreshIndicator(
            onRefresh: refresh,
            child: CustomScrollView(
              slivers: [
                const ProductWrapTitle(title: 'Recommended for You'),
                ProductsWrap(
                  products: state.products,
                  onPress: navigateToDetailsPage,
                )
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
