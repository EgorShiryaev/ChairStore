import 'exception_with_message_exception.dart';

class WeakPasswordException extends ExceptionWithMessage {
  WeakPasswordException() : super(message: 'Weak password');
}
