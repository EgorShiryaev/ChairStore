import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'logic/datasources/auth_remote_datasource.dart';
import 'logic/datasources/cart_local_datasource.dart';
import 'logic/datasources/products_remote_datasource.dart';
import 'logic/datasources/secure_local_datasource.dart';
import 'logic/repositories/auth_repository.dart';
import 'logic/repositories/cart_repository.dart';
import 'logic/repositories/products_repository.dart';
import 'ui/cubits/auth_cubit/auth_cubit.dart';
import 'ui/cubits/cart_cubit/cart_cubit.dart';
import 'ui/cubits/catalog_cubit.dart/catalog_cubit.dart';
import 'ui/cubits/recommended_products_cubit.dart/recommended_products_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependency() async {
  final internetConnectionChecker = InternetConnectionChecker();
  _authCubitDependency(internetConnectionChecker);
  _recommendedProductsCubitDependency(internetConnectionChecker);
  _catalogCubitDependency();
  _cartCubitDependency();
}

void _authCubitDependency(InternetConnectionChecker internetConnectionChecker) {
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(repository: getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      authRemoteDatasource: getIt(),
      secureLocalDatasource: getIt(),
    ),
  );
  getIt.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(
      service: FirebaseAuth.instance,
      internetConnectionChecker: internetConnectionChecker,
    ),
  );
  getIt.registerLazySingleton<SecureLocalDatasource>(
    () => const SecureLocalDatasource(secureStorage: FlutterSecureStorage()),
  );
}

void _recommendedProductsCubitDependency(
    InternetConnectionChecker internetConnectionChecker,) {
  getIt.registerFactory<RecommendedProductsCibit>(
    () => RecommendedProductsCibit(repository: getIt()),
  );
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepository(
      remoteDatasource: getIt(),
    ),
  );
  getIt.registerLazySingleton<ProductsRemoteDatasource>(
    () => ProductsRemoteDatasource(
      service: FirebaseFirestore.instance,
      internetConnectionChecker: internetConnectionChecker,
    ),
  );
}

void _catalogCubitDependency() {
  getIt.registerFactory<CatalogCubit>(
    () => CatalogCubit(repository: getIt()),
  );
}

void _cartCubitDependency() {
  getIt.registerFactory<CartCubit>(
    () => CartCubit(repository: getIt()),
  );

  getIt.registerLazySingleton<CartRepository>(
    () => CartRepository(
      localDatasource: getIt(),
    ),
  );

  getIt.registerLazySingleton<CartLocalDatasource>(
    CartLocalDatasource.new,
  );
}
