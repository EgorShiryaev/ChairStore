import 'package:hive/hive.dart';

import '../adapters/cart_item_hive_adapter.dart';
import '../models/cart_item.dart';

class CartLocalDatasource {
  CartLocalDatasource();

  static const _name = 'cart';

  Future<Box<CartItem>> getBox() async {
    final adapter = CartItemHiveAdapter();

    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter(adapter);
    }
    if (Hive.isBoxOpen(_name)) {
      return Hive.box<CartItem>(_name);
    }
    return Hive.openBox<CartItem>(_name);
  }

  Future<List<CartItem>> getAll() async {
    final box = await getBox();
    return box.values.toList();
  }

  Future<void> update(CartItem item) async {
    final box = await getBox();
    return box.put(item.product.id, item);
  }

  Future<void> add(CartItem item) async {
    final box = await getBox();
    return box.put(item.product.id, item);
  }

  Future<void> delete(String productId) async {
    final box = await getBox();
    return box.delete(productId);
  }

  Future<CartItem?> get(String productId) async {
    final box = await getBox();
    return box.get(productId);
  }
}
