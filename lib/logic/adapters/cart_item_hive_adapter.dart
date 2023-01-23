import 'package:hive/hive.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartItemHiveAdapter extends TypeAdapter<CartItem> {
  @override
  int get typeId => 0;

  @override
  CartItem read(BinaryReader reader) {
    final id = reader.readString();
    final title = reader.readString();
    final description = reader.readString();
    final price = reader.readDouble();
    final imageUrl = reader.readString();
    final product = Product(
      title: title,
      price: price,
      description: description,
      imageUrl: imageUrl,
    );
    product.id = id;
    final quantity = reader.readInt();
    final isSelected = reader.readBool();
    return CartItem(
      product: product,
      quantity: quantity,
      isSelected: isSelected,
    );
  }

  @override
  void write(BinaryWriter writer, CartItem obj) {
    writer.writeString(obj.product.id);
    writer.writeString(obj.product.title);
    writer.writeString(obj.product.description);
    writer.writeDouble(obj.product.price);
    writer.writeString(obj.product.imageUrl);
    writer.writeInt(obj.quantity);
    writer.writeBool(obj.isSelected);
  }
}
