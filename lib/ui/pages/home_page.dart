import 'package:flutter/material.dart';

import '../../logic/models/product.dart';
import '../themes/grid_theme.dart';
import '../themes/list_view_theme.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final listViewTheme = Theme.of(context).extension<ListViewTheme>()!;
    final gridTheme = Theme.of(context).extension<GridTheme>()!;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Scrollbar(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: listViewTheme.padding.copyWith(bottom: 0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                          height: listViewTheme.paddingBetweenElements / 2,),
                      Text(
                        'Recommended for You',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: listViewTheme.paddingBetweenElements)
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: listViewTheme.padding,
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: gridTheme.maxCrossAxisExtent,
                    mainAxisExtent: gridTheme.mainAxisExtent,
                    mainAxisSpacing: gridTheme.mainAxisSpacing,
                    crossAxisSpacing: gridTheme.crossAxisSpacing,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ProductCard(
                        product: Product(
                          title: 'Wood Frame',
                          price: 1600,
                          description:
                              'This chair features a sturdy wooden frame that provides a solid foundation for comfortable seating. The natural grain of the wood gives it a warm, inviting look that pairs well with a variety of decor styles. The design is simple and classic, making it a versatile addition to any room. The chair is a perfect blend of durability and comfort.',
                          imageUrl: 'wood_frame',
                        ),
                      );
                    },
                    childCount: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
