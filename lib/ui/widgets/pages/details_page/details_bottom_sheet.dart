import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/models/product.dart';
import '../../../cubits/cart_cubit/cart_cubit.dart';
import '../../../themes/details_page_theme.dart';
import '../../../themes/page_theme.dart';
import '../../gradient_button.dart';
import 'bottom_sheet_top_indicator.dart';

class DetailsBottomSheet extends StatefulWidget {
  final Product product;
  final BoxConstraints placeholderConstraints;
  const DetailsBottomSheet({
    super.key,
    required this.product,
    required this.placeholderConstraints,
  });

  @override
  State<DetailsBottomSheet> createState() => _DetailsBottomSheetState();
}

class _DetailsBottomSheetState extends State<DetailsBottomSheet> {
  void addProductToCart() {
    BlocProvider.of<CartCubit>(context).add(widget.product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product.title} added to cart'),
        duration: const Duration(milliseconds: 10000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageTheme = Theme.of(context).extension<PageTheme>()!;
    final detailsPageTheme = Theme.of(context).extension<DetailsPageTheme>()!;
    final textTheme = Theme.of(context).textTheme;
    final paddingBetweenText = pageTheme.paddingBetweenElements / 2;
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      reverse: true,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: detailsPageTheme.bottomSheetRadius,
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: pageTheme.padding.copyWith(top: 10, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BottomSheetTopIndicator(),
                  Text(widget.product.title, style: textTheme.headlineLarge),
                  SizedBox(height: paddingBetweenText),
                  Text(
                    widget.product.priceForUi,
                    style: textTheme.headlineSmall,
                  ),
                  SizedBox(height: paddingBetweenText),
                  Text(widget.product.description, style: textTheme.bodyMedium),
                  SizedBox(height: pageTheme.paddingBetweenElements),
                  GradientButton(
                    label: 'Add to cart',
                    onPress: addProductToCart,
                  )
                ],
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: widget.placeholderConstraints,
          child: const AspectRatio(
            aspectRatio: 1,
            child: SizedBox(),
          ),
        ),
      ],
    );
  }
}
