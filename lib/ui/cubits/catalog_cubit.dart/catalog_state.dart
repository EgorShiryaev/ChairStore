import '../../../logic/models/product.dart';

abstract class CatalogState {}

class InitialCatalogState extends CatalogState {}

class LoadingCatalogState extends CatalogState {}

class LoadedCatalogState extends CatalogState {
  final List<Product> products;

  LoadedCatalogState({required this.products});
}

class ErrorCatalogState extends CatalogState {
  final String message;

  ErrorCatalogState({required this.message});
}

class FoundedCatalogState extends CatalogState {
  final List<Product> products;
  final String searchText;

  FoundedCatalogState({
    required this.products,
    required this.searchText,
  });
}
