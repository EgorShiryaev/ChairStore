import 'exception_with_message_exception.dart';

class TechnicalException extends ExceptionWithMessage {
  TechnicalException()
      : super(message: 'Oops, something went wrong. Please try later');
}
