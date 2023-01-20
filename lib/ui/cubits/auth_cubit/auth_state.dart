abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String? email;
  final String? password;
  final String message;

  ErrorAuthState({
    required this.message,
    this.email,
    this.password,
  });
}

class UnAuthState extends AuthState {}
