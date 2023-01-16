import 'exception_with_message_exception.dart';

class UserDisabledException extends ExceptionWithMessage {
  UserDisabledException()
      : super(message: 'The user account has been disabled');
}
