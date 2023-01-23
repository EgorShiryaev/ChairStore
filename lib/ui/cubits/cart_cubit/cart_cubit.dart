import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/index.dart';
import '../../../logic/models/cart_item.dart';
import '../../../logic/models/product.dart';
import '../../../logic/repositories/cart_repository.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository _repository;
  CartCubit({required CartRepository repository})
      : _repository = repository,
        super(InitialCartState());

  void loadAll() {
    emit(LoadingCartState());
    _repository.getAll().then((value) {
      if (value.isEmpty) {
        emit(EmptyCartState());
        return;
      }
      emit(LoadedCartState(cartItems: value));
    }).catchError((error) {
      emit(
        ErrorCartState(message: (error as ExceptionWithMessage).message),
      );
    });
  }

  void refresh() {
    _repository.getAll().then((value) {
      if (value.isEmpty) {
        emit(EmptyCartState());
        return;
      }
      emit(LoadedCartState(cartItems: value));
    }).catchError((error) {
      emit(
        ErrorCartState(message: (error as ExceptionWithMessage).message),
      );
    });
  }

  void add(Product product) {
    _repository.add(product).then((value) {
      refresh();
    }).catchError((error) {
      emit(
        ErrorCartState(message: (error as ExceptionWithMessage).message),
      );
    });
  }

  void update(CartItem item) {
    _repository.update(item).then((value) {
      refresh();
    }).catchError((error) {
      emit(
        ErrorCartState(message: (error as ExceptionWithMessage).message),
      );
    });
  }

  void delete(CartItem item) {
    _repository.delete(item.product.id).then((value) {
      refresh();
    }).catchError((error) {
      emit(
        ErrorCartState(message: (error as ExceptionWithMessage).message),
      );
    });
  }

  Future<void> clear() {
    return _repository.clear().catchError((error) {
      emit(
        ErrorCartState(message: (error as ExceptionWithMessage).message),
      );
    });
  }
}
