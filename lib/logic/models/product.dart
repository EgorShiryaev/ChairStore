class Product {
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  final String priceForUi;

  Product({
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
  }) : priceForUi = _convertDoubleToPriceFormat(price);

  static String _convertDoubleToPriceFormat(double value) {
    final splitedValues = value.toStringAsFixed(2).split('.');
    final cents = splitedValues.last;

    final dollars = _addDevider(splitedValues.first);

    return '\$$dollars,$cents';
  }

  static String _addDevider(String value) {
    const divider = ' ';
    final length = value.length;
    if (length > 3) {
      final newValue = value.substring(0, length - 3);
      final substringedValue = value.substring(length - 3, length);
      return '${_addDevider(newValue)}$divider$substringedValue';
    }
    return value;
  }
}
