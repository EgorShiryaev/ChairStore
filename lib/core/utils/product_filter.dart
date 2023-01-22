import '../../logic/models/product.dart';

class ProductFilter {
  static List<Product> filter(List<Product> products, String text) {
    return products.where((element) => _filterFunction(element, text)).toList();
  }

  static bool _filterFunction(Product product, String text) {
    final lowercaseSearchText = text.toLowerCase();

    return product.title.toLowerCase().contains(lowercaseSearchText) ||
        product.description.toLowerCase().contains(text) ||
        product.price.toString().toLowerCase().contains(lowercaseSearchText) ||
        product.priceForUi.toLowerCase().contains(lowercaseSearchText);
  }
}
