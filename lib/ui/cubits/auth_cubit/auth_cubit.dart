import 'package:chair_store/ui/cubits/auth_cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit {
  AuthCubit() : super(InitialAuthState());

  void login(String email, String password) {}
}
