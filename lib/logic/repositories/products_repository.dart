import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/exceptions/index.dart';
import '../datasources/products_remote_datasource.dart';
import '../models/product.dart';

class ProductsRepository {
  final ProductsRemoteDatasource _remoteDatasource;

  ProductsRepository({required ProductsRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

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
    return TechnicalException();
  }

  Future<List<Product>> getAll() async {
    try {
      final products = await _remoteDatasource.getAll();
      return products;
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }

  Future<List<Product>> getRecommeded() async {
    try {
      final products = await _remoteDatasource.getAll();

      final maxRecommended = (products.length / 2).floor();
      final numberOf = Random().nextInt(maxRecommended) + 1;
      final startOf = Random().nextInt(products.length - 1 - numberOf);

      return products.sublist(startOf, startOf + numberOf);
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }
}
