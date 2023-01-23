import '../../../logic/models/cart_item.dart';

abstract class CartState {}

class InitialCartState extends CartState {}

class LoadingCartState extends CartState {}

class LoadedCartState extends CartState {
  final List<CartItem> cartItems;

  LoadedCartState({required this.cartItems});
}

class ErrorCartState extends CartState {
  final String message;

  ErrorCartState({required this.message});
}

class EmptyCartState extends CartState {}
