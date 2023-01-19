import 'exception_with_user_data.dart';

class UserNotFoundException extends ExceptionWithUserData {
  UserNotFoundException({super.user})
      : super(
          message: 'There is no user record corresponding to this email',
        );
}
