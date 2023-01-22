import 'package:flutter/material.dart';

import '../../../../logic/models/product.dart';
import '../../../themes/details_page_theme.dart';
import '../../../themes/page_theme.dart';
import '../../filled_button.dart';
import 'bottom_sheet_top_indicator.dart';

class DetailsBottomSheet extends StatelessWidget {
  final Product product;
  final BoxConstraints placeholderConstraints;
  const DetailsBottomSheet({
    super.key,
    required this.product,
    required this.placeholderConstraints,
  });

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
                  Text(product.title, style: textTheme.headlineLarge),
                  SizedBox(height: paddingBetweenText),
                  Text(product.priceForUi, style: textTheme.headlineSmall),
                  SizedBox(height: paddingBetweenText),
                  Text(product.description, style: textTheme.bodyMedium),
                  SizedBox(height: pageTheme.paddingBetweenElements),
                  FilledButton(label: 'Add to cart', onPress: () {})
                ],
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: placeholderConstraints,
          child: const AspectRatio(
            aspectRatio: 1,
            child: SizedBox(),
          ),
        ),
      ],
    );
  }
}
