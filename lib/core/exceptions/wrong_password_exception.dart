import 'exception_with_message_exception.dart';

class WrongPasswordException extends ExceptionWithMessage {
  WrongPasswordException() : super(message: 'Wrong password');
}
