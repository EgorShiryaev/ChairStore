import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

class ProductsRemoteDatasource {
  final FirebaseFirestore _service;

  ProductsRemoteDatasource({
    required FirebaseFirestore service,
  }) : _service = service;

  static const _path = 'products';

  Future<List<Product>> getAll() async {
    final snapshot = await _service.collection(_path).get();

    return snapshot.docs.map(Product.fromSnapshot).toList();
  }
}
