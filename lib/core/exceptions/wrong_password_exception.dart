import 'exception_with_user_data.dart';

class WrongPasswordException extends ExceptionWithUserData {
  WrongPasswordException({super.user})
      : super(
          message: 'Wrong password',
        );
}
