import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/exception_with_message_exception.dart';
import '../../../logic/models/order_history_item.dart';
import '../../../logic/repositories/order_history_repository.dart';
import 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  final OrderHistoryRepository _repository;
  OrderHistoryCubit({required OrderHistoryRepository repository})
      : _repository = repository,
        super(InitialOrderHistoryState());

  // ignore: prefer_void_to_null
  FutureOr<Null> _errorHandler(error) {
    emit(
      ErrorOrderHistoryState(
        message: (error as ExceptionWithMessage).message,
      ),
    );
  }

  Future<void> loadAll() async {
    emit(LoadingOrderHistoryState());
    await _repository.getAll().then((value) {
      if (value.isEmpty) {
        emit(EmptyOrderHistoryState());
        return;
      }
      emit(LoadedOrderHistoryState(history: value));
    }).catchError(_errorHandler);
  }

  void add(OrderHistoryItem item) {
    _repository.add(item).catchError(_errorHandler);
  }
}
