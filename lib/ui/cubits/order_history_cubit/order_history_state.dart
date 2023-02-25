import '../../../logic/models/order_history_item.dart';

abstract class OrderHistoryState {}

class InitialOrderHistoryState extends OrderHistoryState {}

class LoadingOrderHistoryState extends OrderHistoryState {}

class LoadedOrderHistoryState extends OrderHistoryState {
  final List<OrderHistoryItem> history;

  LoadedOrderHistoryState({required this.history});
}

class EmptyOrderHistoryState extends OrderHistoryState {}

class ErrorOrderHistoryState extends OrderHistoryState {
  final String message;

  ErrorOrderHistoryState({required this.message});
}
