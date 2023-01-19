import 'package:flutter/material.dart';

import '../../../logic/models/page_arguments/details_page_arguments.dart';
import '../../themes/details_page_theme.dart';
import '../../themes/page_theme.dart';
import '../filled_button.dart';
import 'details_bottom_sheet.dart';
import 'product_image.dart';

class DetailsPageBody extends StatelessWidget {
  const DetailsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments!;
    final product = (args as DetailsPageArguments).product;

    return LayoutBuilder(
      builder: (context, constraints) {
        final imageConstraints = BoxConstraints(
          maxWidth: constraints.maxWidth >= constraints.maxHeight
              ? constraints.maxHeight * (2 / 3)
              : constraints.maxWidth,
          maxHeight: constraints.maxWidth >= constraints.maxHeight
              ? constraints.maxHeight * (2 / 3)
              : constraints.maxWidth,
        );
        return Stack(
          children: [
            ProductImage(
              url: product.imageUrl,
              constraints: imageConstraints,
            ),
            DetailsBottomSheet(
              product: product,
              placeholderConstraints: imageConstraints,
            )
          ],
        );
      },
    );
  }
}
