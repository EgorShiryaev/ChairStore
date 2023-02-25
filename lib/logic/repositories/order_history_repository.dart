import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/exceptions/index.dart';
import '../../core/exceptions/no_internet_connection_exception.dart';
import '../datasources/order_history_remote_datasource.dart';
import '../models/order_history_item.dart';

class OrderHistoryRepository {
  final OrderHistoryRemoteDatasource _remoteDatasource;

  OrderHistoryRepository({
    required OrderHistoryRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  ExceptionWithMessage _exceptionHandler(
    Object exception,
  ) {
    if (exception is FirebaseException) {
      switch (exception.code) {
        case 'aborted':
          return AbortedException();
        case 'already-exists':
          return AlreadyExistsException();
        case 'cancelled':
          return CancelledException();
        case 'data-loss':
          return DataLossException();
        case 'deadline-exceeded':
          return DeadlineExceededException();
        case 'failed-precondition':
          return FailedPreconditionException();
        case 'internal':
          return TechnicalException();
        case 'invalid-argument':
          return InvalidArgumentException();
        case 'not-found':
          return NotFoundException();
        case 'out-of-range':
          return OutOfRangeException();
        case 'permission-denied':
          return PermissionDeniedException();
        case 'resource-exhausted':
          return ResourceExhaustedException();
        case 'unauthenticated':
          return UnauthenticatedException();
        case 'unavailable':
          return UnavailableException();
        case 'unimplemented':
          return TechnicalException();
        case 'unknown':
          return TechnicalException();
        default:
          return TechnicalException();
      }
    }
    if (exception is NoInternetConnectionException) {
      return exception;
    }
    return TechnicalException();
  }

  Future<List<OrderHistoryItem>> getAll() async {
    try {
      final orderHistoryItems = await _remoteDatasource.getAll();
      return orderHistoryItems;
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }

  Future<void> add(OrderHistoryItem item) async {
    try {
      return _remoteDatasource.add(item);
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }
}
