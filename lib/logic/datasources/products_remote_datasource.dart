import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../core/exceptions/no_internet_connection_exception.dart';
import '../models/product.dart';

class ProductsRemoteDatasource {
  final FirebaseFirestore _service;
  final InternetConnectionChecker _internetConnectionChecker;

  ProductsRemoteDatasource({
    required FirebaseFirestore service,
    required InternetConnectionChecker internetConnectionChecker,
  })  : _service = service,
        _internetConnectionChecker = internetConnectionChecker;

  static const _path = 'products';

  Future<List<Product>> getAll() async {
    final deviceIsConnected = await _internetConnectionChecker.hasConnection;

    if (!deviceIsConnected) {
      throw NoInternetConnectionException();
    }

    final snapshot = await _service.collection(_path).get();

    return snapshot.docs.map(Product.fromSnapshot).toList();
  }
}
