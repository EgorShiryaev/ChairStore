import '../exception_with_message_exception.dart';

class InvalidArgumentException extends ExceptionWithMessage {
  InvalidArgumentException() : super(message: 'Invalid request argument');
}
