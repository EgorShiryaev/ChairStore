import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'logic/datasources/auth_remote_datasource.dart';
import 'logic/datasources/secure_local_datasource.dart';
import 'logic/repositories/auth_repository.dart';
import 'ui/cubits/auth_cubit/auth_cubit.dart';

final getIt = GetIt.instance;

void setupDependency() {
  _authCubitDependency();
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
