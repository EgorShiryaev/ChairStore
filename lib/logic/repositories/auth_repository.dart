import 'package:firebase_auth/firebase_auth.dart';

import '../../core/exceptions/email_already_in_use_exception.dart';
import '../../core/exceptions/invalid_email_exception.dart';
import '../../core/exceptions/no_auth_data_exception.dart';
import '../../core/exceptions/technical_exception.dart';
import '../../core/exceptions/too_many_requests_exception.dart';
import '../../core/exceptions/user_disabled_exception.dart';
import '../../core/exceptions/user_not_found_exception.dart';
import '../../core/exceptions/weak_password_exception.dart';
import '../../core/exceptions/wrong_password_exception.dart';
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

  void _exceptionHandler(Object exception, {UserData? user}) {
    if (exception is FirebaseAuthException) {
      switch (exception.code) {
        case 'invalid-email':
          throw InvalidEmailException();
        case 'weak-password':
          throw WeakPasswordException();
        case 'email-already-in-use':
          throw EmailAlreadyInUseException();
        case 'user-not-found':
          throw UserNotFoundException(user: user);
        case 'user-disabled':
          throw UserDisabledException(user: user);
        case 'wrong-password':
          throw WrongPasswordException(user: user);
        case 'too-many-requests':
          throw TooManyRequestsException(user: user);
        case 'operation-not-allowed':
          throw TechnicalException(user: user);
        default:
          throw TechnicalException(user: user);
      }
    }
    throw TechnicalException(user: user);
  }

  Future<void> login(UserData data) async {
    try {
      final credential = await _authRemoteDatasource.login(data);
      userEmail = credential.user!.email;
      await _secureLocalDatasource.saveUserData(data);
    } catch (e) {
      _exceptionHandler(e);
    }
  }

  Future<void> signUp(UserData data) async {
    try {
      final credential = await _authRemoteDatasource.signUp(data);
      userEmail = credential.user!.email;
      await _secureLocalDatasource.saveUserData(data);
    } catch (e) {
      _exceptionHandler(e);
    }
  }

  Future<void> logout() async {
    try {
      await _authRemoteDatasource.logout();
      userEmail = null;
      await _secureLocalDatasource.deleteUser();
    } catch (e) {
      _exceptionHandler(e);
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
        throw NoAuthDataException();
      }
      final user = await _secureLocalDatasource.user;
      _exceptionHandler(e, user: user);
    }
  }
}
