import 'package:firebase_auth/firebase_auth.dart';

import '../../core/exceptions/index.dart';
import '../../core/exceptions/no_internet_connection_exception.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/secure_local_datasource.dart';
import '../models/auth_data.dart';
import '../utils/user_utils.dart';

class AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;
  final SecureLocalDatasource _secureLocalDatasource;

  AuthRepository({
    required AuthRemoteDatasource authRemoteDatasource,
    required SecureLocalDatasource secureLocalDatasource,
  })  : _authRemoteDatasource = authRemoteDatasource,
        _secureLocalDatasource = secureLocalDatasource;

  ExceptionWithMessage _exceptionHandler(Object exception, {AuthData? user}) {
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
    if (exception is NoInternetConnectionException) {
      return exception;
    }
    return TechnicalException(user: user);
  }

  Future<void> login(AuthData data) async {
    try {
      final credential = await _authRemoteDatasource.login(data);
      setUser(credential.user!.uid, credential.user!.email);
      await _secureLocalDatasource.saveUserData(data);
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }

  Future<void> signUp(AuthData data) async {
    try {
      final credential = await _authRemoteDatasource.signUp(data);
      setUser(credential.user!.uid, credential.user!.email);
      await _secureLocalDatasource.saveUserData(data);
    } catch (e) {
      throw _exceptionHandler(e);
    }
  }

  Future<void> logout() async {
    try {
      await _authRemoteDatasource.logout();
      setUser(null, null);
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
        setUser(credential.user!.uid, credential.user!.email);
      } else {
        throw NoAuthDataException();
      }
    } catch (e) {
      if (e is NoAuthDataException) {
        rethrow;
      }
      final user = await _secureLocalDatasource.user;
      throw _exceptionHandler(e, user: user);
    }
  }
}
