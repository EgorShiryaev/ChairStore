import '../../../logic/models/product.dart';

abstract class RecommendedProductsState {}

class InitialRecommendedProductsState extends RecommendedProductsState {}

class LoadingRecommendedProductsState extends RecommendedProductsState {}

class LoadedRecommendedProductsState extends RecommendedProductsState {
  final List<Product> products;

  LoadedRecommendedProductsState({required this.products});
}

class EmptyRecommendedProductsState extends RecommendedProductsState {}

class ErrorRecommendedProductsState extends RecommendedProductsState {
  final String message;

  ErrorRecommendedProductsState({required this.message});
}
