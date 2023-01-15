import '../datasources/auth_remote_datasource.dart';
import '../datasources/secure_local_datasource.dart';
import '../models/user_data.dart';

class AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;
  final SecureLocalDatasource _secureLocalDatasource;

  AuthRepository({
    required AuthRemoteDatasource authRemoteDatasource,
    required SecureLocalDatasource secureLocalDatasource,
  })  : _authRemoteDatasource = authRemoteDatasource,
        _secureLocalDatasource = secureLocalDatasource;

  Future<void> login(UserData data) async {
    await _authRemoteDatasource.login(data);
    await _secureLocalDatasource.saveUserData(data);
  }

  Future<void> signUp(UserData data) async {
    await _authRemoteDatasource.signUp(data);
    await _secureLocalDatasource.saveUserData(data);
  }

  Future<void> logout() async {
    await _authRemoteDatasource.logout();
    await _secureLocalDatasource.deleteUser();
  }

  Future<void> updateAuthorization() async {
    final user = await _secureLocalDatasource.user;

    if (user != null) {
      await _authRemoteDatasource.login(user);
    } else {
      throw Exception('User not saved');
    }
  }
}
