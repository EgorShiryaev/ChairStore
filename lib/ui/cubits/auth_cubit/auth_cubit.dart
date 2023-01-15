import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/models/user_data.dart';
import '../../../logic/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit({required this.repository}) : super(LoadingAuthState());

  Future<void> login(String email, String password) async {
    emit(LoadingAuthState());

    final data = UserData(email: email, password: password);

    await repository.login(data).then((_) {
      emit(SuccessAuthState());
    }).catchError((error) {
      emit(ErrorAuthState(message: error.toString()));
    });
  }

  Future<void> signUp(String email, String password) async {
    emit(LoadingAuthState());

    final data = UserData(email: email, password: password);

    await repository.signUp(data).then((_) {
      emit(SuccessAuthState());
    }).catchError((error) {
      emit(ErrorAuthState(message: error.toString()));
    });
  }

  Future<void> logout() async {
    emit(LoadingAuthState());

    await repository.logout().then((_) {
      emit(UnAuthState());
    }).catchError((error) {
      emit(ErrorAuthState(message: error.toString()));
    });
  }

  void updateAuthSession() {
    unawaited(
      repository.updateAuthorization().then((_) {
        emit(SuccessAuthState());
      }).catchError((error) {
        emit(ErrorAuthState(message: error.toString()));
      }),
    );
  }
}
