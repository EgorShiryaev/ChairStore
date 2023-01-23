import '../../core/exceptions/index.dart';
import '../datasources/cart_local_datasource.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartRepository {
  final CartLocalDatasource _localDatasource;

  CartRepository({
    required CartLocalDatasource localDatasource,
  }) : _localDatasource = localDatasource;

  ExceptionWithMessage _exceptionHandler(Object exception) {
    return TechnicalException();
  }

  Future<List<CartItem>> getAll() {
    try {
      return _localDatasource.getAll();
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }

  Future<void> add(Product product) async {
    try {
      final productIsExist = await _localDatasource.get(product.id) == null;
      if (productIsExist) {
        return _localDatasource.add(
          CartItem(
            product: product,
            quantity: 1,
            isSelected: false,
          ),
        );
      }
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }

  Future<void> update(CartItem item) {
    try {
      return _localDatasource.update(item);
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }

  Future<void> delete(String productId) {
    try {
      return _localDatasource.delete(productId);
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }
}
