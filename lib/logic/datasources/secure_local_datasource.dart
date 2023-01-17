import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/user_data.dart';

class SecureLocalDatasource {
  static const _emailKey = 'email';
  static const _passworkKey = 'password';

  final FlutterSecureStorage _secureStorage;

  const SecureLocalDatasource({
    required FlutterSecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  Future<UserData?> get user async {
    final email = await _secureStorage.read(key: _emailKey);
    final password = await _secureStorage.read(key: _passworkKey);
    if (email == null || password == null) {
      return null;
    }
    return UserData(email: email, password: password);
  }

  Future<void> saveUserData(UserData user) async {
    await _secureStorage.write(key: _emailKey, value: user.email);
    await _secureStorage.write(key: _passworkKey, value: user.password);
  }

  Future<void> deleteUser() async {
    await _secureStorage.delete(key: _emailKey);
    await _secureStorage.delete(key: _passworkKey);
  }
}
