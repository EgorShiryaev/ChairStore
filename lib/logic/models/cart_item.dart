import 'product.dart';

class CartItem {
  final Product product;
  int quantity;
  bool isSelected;

  CartItem({
    required this.product,
    required this.quantity,
    required this.isSelected,
  });

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    quantity--;
  }

  void changeIsSelected() {
    isSelected = !isSelected;
  }
}
