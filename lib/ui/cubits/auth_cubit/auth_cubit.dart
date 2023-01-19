import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/exceptions/exception_with_message_exception.dart';
import '../../../core/exceptions/exception_with_user_data.dart';
import '../../../core/exceptions/no_auth_data_exception.dart';
import '../../../logic/models/user_data.dart';
import '../../../logic/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;

  AuthCubit({required AuthRepository repository})
      : _repository = repository,
        super(InitialAuthState());

  Future<void> login(String email, String password) async {
    emit(LoadingAuthState());

    final data = UserData(email: email, password: password);

    await _repository.login(data).then((_) {
      emit(SuccessAuthState());
    }).catchError((error) {
      emit(ErrorAuthState(
        message: (error as ExceptionWithMessage).message,
        email: email,
      ));
    });
  }

  Future<void> signUp(String email, String password) async {
    emit(LoadingAuthState());

    final data = UserData(email: email, password: password);

    await _repository.signUp(data).then((_) {
      emit(SuccessAuthState());
    }).catchError((error) {
      emit(ErrorAuthState(
        message: (error as ExceptionWithMessage).message,
        email: email,
      ));
    });
  }

  Future<void> logout() async {
    emit(LoadingAuthState());

    await _repository.logout().then((_) {
      emit(UnAuthState());
    }).catchError((error) {
      emit(ErrorAuthState(
        message: (error as ExceptionWithMessage).message,
      ));
    });
  }

  void updateAuthSession() {
    _repository.updateAuthorization().then((_) {
      emit(SuccessAuthState());
      // emit(UnAuthState());
    }).catchError((error) {
      if (error is NoAuthDataException) {
        emit(UnAuthState());
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
