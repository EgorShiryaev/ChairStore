abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String message;

  ErrorAuthState({required this.message});
}

class UnAuthState extends AuthState {}
