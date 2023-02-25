import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/exception_with_message_exception.dart';
import '../../../core/utils/product_filter.dart';
import '../../../logic/models/product.dart';
import '../../../logic/repositories/products_repository.dart';
import 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  final ProductsRepository _repository;
  CatalogCubit({required ProductsRepository repository})
      : _repository = repository,
        super(InitialCatalogState());

  List<Product> _lastAllProducts = [];

  void _setAllProducts(List<Product> newAllProducts) {
    _lastAllProducts = [...newAllProducts];
  }

  // ignore: prefer_void_to_null
  FutureOr<Null> _errorHandler(error) {
    emit(
      ErrorCatalogState(
        message: (error as ExceptionWithMessage).message,
      ),
    );
  }

  void loadAll() {
    emit(LoadingCatalogState());
    _repository.getAll().then((value) {
      _setAllProducts(value);
      emit(LoadedCatalogState(products: value));
    }).catchError(_errorHandler);
  }

  Future<void> refresh() async {
    try {
      if (state is FoundedCatalogState) {
        await _repository.getAll().then((value) {
          _emitNewFoundedCatalogState(
            products: (state as FoundedCatalogState).products,
            searchText: (state as FoundedCatalogState).searchText,
          );
        });
        return;
      } else if (state is LoadedCatalogState) {
        await _repository.getAll().then((value) {
          _setAllProducts(value);
          emit(LoadedCatalogState(products: value));
        });
      }
    } catch (e) {
      _errorHandler(e);
    }
  }

  void _emitNewFoundedCatalogState({
    required List<Product> products,
    required String searchText,
  }) {
    final newItems = ProductFilter.filter(products, searchText);
    emit(
      FoundedCatalogState(
        products: newItems,
        searchText: searchText,
      ),
    );
  }

  void search(String text) {
    if (state is FoundedCatalogState) {
      if (text.isEmpty) {
        emit(LoadedCatalogState(products: _lastAllProducts));
        refresh();
      } else if ((state as FoundedCatalogState).searchText.length <=
          text.length) {
        _emitNewFoundedCatalogState(
          products: (state as FoundedCatalogState).products,
          searchText: text,
        );
      } else {
        _emitNewFoundedCatalogState(
          products: _lastAllProducts,
          searchText: text,
        );
      }
    } else if (state is LoadedCatalogState) {
      _emitNewFoundedCatalogState(
        products: (state as LoadedCatalogState).products,
        searchText: text,
      );
    }
  }
}
