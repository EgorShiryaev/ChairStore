import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/index.dart';
import '../../../logic/repositories/products_repository.dart';
import 'recommended_products_state.dart';

class RecommendedProductsCibit extends Cubit<RecommendedProductsState> {
  final ProductsRepository _repository;
  RecommendedProductsCibit({required ProductsRepository repository})
      : _repository = repository,
        super(InitialRecommendedProductsState());

  void loadAll() {
    emit(LoadingRecommendedProductsState());
    _repository.getRecommeded().then((value) {
      emit(LoadedRecommendedProductsState(products: value));
    }).catchError((error) {
      emit(
        ErrorRecommendedProductsState(
          message: (error as ExceptionWithMessage).message,
        ),
      );
    });
  }

  Future<void> refresh() async {
    await _repository.getRecommeded().then((value) {
      emit(LoadedRecommendedProductsState(products: value));
    }).catchError((error) {
      emit(
        ErrorRecommendedProductsState(
          message: (error as ExceptionWithMessage).message,
        ),
      );
    });
  }
}
