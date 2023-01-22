import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_data.dart';

class AuthRemoteDatasource {
  final FirebaseAuth _service;

  AuthRemoteDatasource({
    required FirebaseAuth service,
  }) : _service = service;

  Future<UserCredential> login(UserData data) {
    log('${data.email}: ${data.password}');

    return _service.signInWithEmailAndPassword(
      email: data.email,
      password: data.password,
    );
  }

  Future<UserCredential> signUp(UserData data) {
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
