import 'package:flutter/material.dart';

import '../../logic/models/page_arguments/details_page_arguments.dart';
import '../themes/details_page_theme.dart';
import '../themes/list_view_theme.dart';
import '../themes/page_theme.dart';
import '../widgets/asset_icon.dart';
import '../widgets/filled_button.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments!;
    final product = (args as DetailsPageArguments).product;
    final detailsPageTheme = Theme.of(context).extension<DetailsPageTheme>()!;
    final pageTheme = Theme.of(context).extension<PageTheme>()!;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: detailsPageTheme.backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'Cart',
            onPressed: () {},
            icon: const AssetIcon(iconName: 'cart'),
          )
        ],
        shape: const Border(),
        backgroundColor: detailsPageTheme.backgroundColor,
      ),
      body: LayoutBuilder(
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
              Padding(
                padding: pageTheme.padding,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    constraints: imageConstraints,
                    child: Image.asset(
                      'assets/images/${product.imageUrl}.png',
                    ),
                  ),
                ),
              ),
              ListView(
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Center(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const SizedBox(height: 3, width: 50),
                                ),
                              ),
                            ),
                            Text(product.title, style: textTheme.headlineLarge),
                            SizedBox(height: pageTheme.paddingBetweenElements),
                            Text(
                              product.priceForUi,
                              style: textTheme.headlineSmall,
                            ),
                            SizedBox(height: pageTheme.paddingBetweenElements),
                            Text(
                              product.description,
                              style: textTheme.bodyMedium,
                            ),
                            SizedBox(height: pageTheme.paddingBetweenElements),
                            FilledButton(label: 'Add to cart', onPress: () {})
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    constraints: imageConstraints,
                    child: const AspectRatio(
                      aspectRatio: 1,
                      child: SizedBox(),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
