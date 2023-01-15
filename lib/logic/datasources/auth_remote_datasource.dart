import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_data.dart';

class AuthRemoteDatasource {
  final FirebaseAuth _service;

  AuthRemoteDatasource({
    required FirebaseAuth service,
  })  : _service = service,
        super();

  Future<UserCredential> login(UserData data) {
    return _service.signInWithEmailAndPassword(
      email: data.email,
      password: data.password,
    );
  }

  Future<UserCredential> signUp(UserData data) {
    return _service.createUserWithEmailAndPassword(
      email: data.email,
      password: data.password,
    );
  }

  Future<void> logout() {
    return _service.signOut();
  }
}
