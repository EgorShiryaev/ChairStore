import 'exception_with_message_exception.dart';

class UserNotFoundException extends ExceptionWithMessage {
  UserNotFoundException()
      : super(message: 'There is no user record corresponding to this email');
}
