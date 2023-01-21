import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/repositories/products_repository.dart';
import 'recommended_products_state.dart';

class RecommendedProductsCibit extends Cubit<RecommendedProductsState> {
  final ProductsRepository _repository;
  RecommendedProductsCibit({required ProductsRepository repository})
      : _repository = repository,
        super(InitialRecommendedProductsState());

  void loadRecommendedProducts() {
    emit(LoadingRecommendedProductsState());
    _repository.getRecommeded().then((value) {
      if (value.isEmpty) {
        return emit(EmptyRecommendedProductsState());
      }
      emit(LoadedRecommendedProductsState(products: value));
    }).catchError((error){
      
    });
  }
}
