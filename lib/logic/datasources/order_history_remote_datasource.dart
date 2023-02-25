import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../core/exceptions/no_internet_connection_exception.dart';
import '../../user.dart';
import '../models/order_history_item.dart';

class OrderHistoryRemoteDatasource {
  final FirebaseFirestore _service;
  final InternetConnectionChecker _internetConnectionChecker;

  OrderHistoryRemoteDatasource({
    required FirebaseFirestore service,
    required InternetConnectionChecker internetConnectionChecker,
  })  : _service = service,
        _internetConnectionChecker = internetConnectionChecker;

  static const _path = 'orderHistory';

  CollectionReference<Map<String, dynamic>> get _collection =>
      _service.collection(_path);

  Future<List<OrderHistoryItem>> getAll() async {
    final deviceIsConnected = await _internetConnectionChecker.hasConnection;

    if (!deviceIsConnected) {
      throw NoInternetConnectionException();
    }

    final snapshot =
        await _collection.where('userId', isEqualTo: user.id).get();

    final result =
        snapshot.docs.map((e) => OrderHistoryItem.fromJson(e.data())).toList();

    result.sort((a, b) => b.timestamp!.compareTo(a.timestamp!));

    return result;
  }

  Future<void> add(OrderHistoryItem item) async {
    final deviceIsConnected = await _internetConnectionChecker.hasConnection;

    if (!deviceIsConnected) {
      throw NoInternetConnectionException();
    }

    item.setTimestamp(Timestamp.now());

    await _collection.add({'userId': user.id, ...item.toJson()});
  }
}
