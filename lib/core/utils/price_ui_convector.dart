import '../../logic/models/cart_item.dart';

class PriceUiConvector {
  static String toPriceFormat(double value) {
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
