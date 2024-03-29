import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/index.dart';
import '../../../logic/models/auth_data.dart';
import '../../../logic/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;

  AuthCubit({required AuthRepository repository})
      : _repository = repository,
        super(InitialAuthState());

  Future<void> login(String email, String password) async {
    emit(LoadingAuthState());

    final data = AuthData(email: email, password: password);

    await _repository.login(data).then((_) {
      emit(SuccessAuthState());
    }).catchError((error) {
      emit(
        ErrorAuthState(
          message: (error as ExceptionWithMessage).message,
          email: email,
        ),
      );
    });
  }

  Future<void> signUp(String email, String password) async {
    emit(LoadingAuthState());

    final data = AuthData(email: email, password: password);

    await _repository.signUp(data).then((_) {
      emit(SuccessAuthState());
    }).catchError((error) {
      emit(
        ErrorAuthState(
          message: (error as ExceptionWithMessage).message,
          email: email,
        ),
      );
    });
  }

  Future<void> logout() async {
    emit(LoadingAuthState());

    await _repository.logout().then((_) {
      emit(UnAuthState());
    }).catchError((error) {
      emit(
        ErrorAuthState(
          message: (error as ExceptionWithMessage).message,
        ),
      );
    });
  }

  void updateAuthSession() {
    _repository.updateAuthorization().then((_) {
      emit(SuccesUpdateSessionAuthState());
    }).catchError((error) {
      if (error is NoAuthDataException) {
        emit(UnAuthState());
        return;
      }

      if (error is ExceptionWithUserData) {
        emit(
          ErrorAuthState(
            message: error.message,
            email: error.user!.email,
            password: error.user!.password,
          ),
        );
        return;
      }

      emit(ErrorAuthState(message: (error as ExceptionWithMessage).message));
    });
  }
}
