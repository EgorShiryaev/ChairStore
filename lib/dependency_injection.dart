import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'logic/datasources/auth_remote_datasource.dart';
import 'logic/datasources/products_remote_datasource.dart';
import 'logic/datasources/secure_local_datasource.dart';
import 'logic/repositories/auth_repository.dart';
import 'logic/repositories/products_repository.dart';
import 'ui/cubits/auth_cubit/auth_cubit.dart';
import 'ui/cubits/catalog_cubit.dart/catalog_cubit.dart';
import 'ui/cubits/recommended_products_cubit.dart/recommended_products_cubit.dart';

final getIt = GetIt.instance;

void setupDependency() {
  _authCubitDependency();
  _recommendedProductsCubitDependency();
  _catalogCubitDependency();
}

void _authCubitDependency() {
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
    () => AuthRemoteDatasource(service: FirebaseAuth.instance),
  );
  getIt.registerLazySingleton<SecureLocalDatasource>(
    () => const SecureLocalDatasource(secureStorage: FlutterSecureStorage()),
  );
}

void _recommendedProductsCubitDependency() {
  getIt.registerFactory<RecommendedProductsCibit>(
    () => RecommendedProductsCibit(repository: getIt()),
  );
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepository(
      datasource: getIt(),
    ),
  );
  getIt.registerLazySingleton<ProductsRemoteDatasource>(
    () => ProductsRemoteDatasource(service: FirebaseFirestore.instance),
  );
}

void _catalogCubitDependency() {
  getIt.registerFactory<CatalogCubit>(
    () => CatalogCubit(repository: getIt()),
  );
}
