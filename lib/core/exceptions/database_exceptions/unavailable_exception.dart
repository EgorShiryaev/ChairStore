import '../exception_with_message_exception.dart';

class UnavailableException extends ExceptionWithMessage {
  UnavailableException() : super(message: 'Database is unavailable');
}
