import 'exception_with_user_data.dart';

class UserDisabledException extends ExceptionWithUserData {
  UserDisabledException({super.user})
      : super(
          message: 'The user account has been disabled',
        );
}
