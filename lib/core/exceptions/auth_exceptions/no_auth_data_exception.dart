import '../exception_with_message_exception.dart';

class NoAuthDataException extends ExceptionWithMessage {
  NoAuthDataException() : super(message: 'No auth data');
}
