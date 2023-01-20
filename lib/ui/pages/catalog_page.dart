import 'package:flutter/material.dart';

import '../../logic/models/product.dart';
import '../themes/list_view_theme.dart';
import '../widgets/catalog_page/search_field.dart';
import '../widgets/product_widgets/product_wrap_title.dart';
import '../widgets/product_widgets/products_wrap.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  String searchValue = '';

  void setSearchText(String value) {
    setState(() {
      searchValue = value;
    });
  }

  void changedSearchText(String newValue) {
    setSearchText(newValue);
  }

  void clear() {
    setSearchText('');
  }

  @override
  Widget build(BuildContext context) {
    final listViewTheme = Theme.of(context).extension<ListViewTheme>()!;
    return Scaffold(
      appBar: AppBar(
        title: SearchField(
          value: searchValue,
          clear: clear,
          onChanged: changedSearchText,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(8),
          child: SizedBox(),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            if (searchValue.isNotEmpty)
              const ProductWrapTitle(title: 'Found 6 results'),
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
            ),
          ],
        ),
      ),
    );
  }
}
