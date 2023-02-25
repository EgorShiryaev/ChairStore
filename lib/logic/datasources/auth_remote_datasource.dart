import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../core/exceptions/no_internet_connection_exception.dart';
import '../models/auth_data.dart';

class AuthRemoteDatasource {
  final FirebaseAuth _service;
  final InternetConnectionChecker _internetConnectionChecker;

  AuthRemoteDatasource({
    required FirebaseAuth service,
    required InternetConnectionChecker internetConnectionChecker,
  })  : _service = service,
        _internetConnectionChecker = internetConnectionChecker;

  Future<UserCredential> login(AuthData data) async {
    final deviceIsConnected = await _internetConnectionChecker.hasConnection;

    if (!deviceIsConnected) {
      throw NoInternetConnectionException(user: data);
    }

    log('${data.email}: ${data.password}');

    return _service.signInWithEmailAndPassword(
      email: data.email,
      password: data.password,
    );
  }

  Future<UserCredential> signUp(AuthData data) async {
    final deviceIsConnected = await _internetConnectionChecker.hasConnection;

    if (!deviceIsConnected) {
      throw NoInternetConnectionException();
    }

    log('${data.email}: ${data.password}');

    return _service.createUserWithEmailAndPassword(
      email: data.email,
      password: data.password,
    );
  }

  Future<void> logout() {
    return _service.signOut();
  }
}
