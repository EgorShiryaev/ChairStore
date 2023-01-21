import 'package:firebase_auth/firebase_auth.dart';

import '../../core/exceptions/index.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/secure_local_datasource.dart';
import '../models/user_data.dart';

String? userEmail;

class AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;
  final SecureLocalDatasource _secureLocalDatasource;

  AuthRepository({
    required AuthRemoteDatasource authRemoteDatasource,
    required SecureLocalDatasource secureLocalDatasource,
  })  : _authRemoteDatasource = authRemoteDatasource,
        _secureLocalDatasource = secureLocalDatasource;

  ExceptionWithMessage _exceptionHandler(Object exception, {UserData? user}) {
    if (exception is FirebaseAuthException) {
      switch (exception.code) {
        case 'invalid-email':
          return InvalidEmailException();
        case 'weak-password':
          return WeakPasswordException();
        case 'email-already-in-use':
          return EmailAlreadyInUseException();
        case 'user-not-found':
          return UserNotFoundException(user: user);
        case 'user-disabled':
          return UserDisabledException(user: user);
        case 'wrong-password':
          return WrongPasswordException(user: user);
        case 'too-many-requests':
          return TooManyRequestsException(user: user);
        case 'operation-not-allowed':
          return TechnicalException(user: user);
      }
    }
    return TechnicalException(user: user);
  }

  Future<void> login(UserData data) async {
    try {
      final credential = await _authRemoteDatasource.login(data);
      userEmail = credential.user!.email;
      await _secureLocalDatasource.saveUserData(data);
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }

  Future<void> signUp(UserData data) async {
    try {
      final credential = await _authRemoteDatasource.signUp(data);
      userEmail = credential.user!.email;
      await _secureLocalDatasource.saveUserData(data);
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }

  Future<void> logout() async {
    try {
      await _authRemoteDatasource.logout();
      userEmail = null;
      await _secureLocalDatasource.deleteUser();
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }

  Future<void> updateAuthorization() async {
    try {
      final user = await _secureLocalDatasource.user;

      if (user != null) {
        final credential = await _authRemoteDatasource.login(user);
        userEmail = credential.user!.email;
      } else {
        throw NoAuthDataException();
      }
    } catch (e) {
      if (e is NoAuthDataException) {
        rethrow;
      }
      final user = await _secureLocalDatasource.user;
      _exceptionHandler(e, user: user);
    }
  }
}
