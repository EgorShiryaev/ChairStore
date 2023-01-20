import 'package:flutter/material.dart';

import '../../logic/models/product.dart';
import '../widgets/product_widgets/product_wrap_title.dart';
import '../widgets/product_widgets/products_wrap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const ProductWrapTitle(title: 'Recommended for You'),
            ProductsWrap(
              products: List.generate(
                20,
                (index) => Product(
                  title: 'Wood Frame',
                  price: 1600,
                  description:
                      'This chair features a sturdy wooden frame that provides a solid foundation for comfortable seating. The natural grain of the wood gives it a warm, inviting look that pairs well with a variety of decor styles. The design is simple and classic, making it a versatile addition to any room. The chair is a perfect blend of durability and comfort.',
                  imageUrl: 'wood_frame',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
