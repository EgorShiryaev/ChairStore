import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/recommended_products_cubit.dart/recommended_products_cubit.dart';
import '../../cubits/recommended_products_cubit.dart/recommended_products_state.dart';
import '../product_widgets/product_wrap_title.dart';
import '../product_widgets/products_wrap.dart';
import '../state_widgets/error_mask.dart';
import '../state_widgets/loading_mask.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  void retryLoad() {
    BlocProvider.of<RecommendedProductsCibit>(context)
        .loadRecommendedProducts();
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
          return CustomScrollView(
            slivers: [
              const ProductWrapTitle(title: 'Recommended for You'),
              ProductsWrap(products: state.products)
            ],
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
