import '../exception_with_message_exception.dart';

class InvalidEmailException extends ExceptionWithMessage {
  InvalidEmailException() : super(message: 'The email address is not valid');
}
