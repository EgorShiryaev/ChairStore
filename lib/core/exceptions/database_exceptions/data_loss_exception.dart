import '../exception_with_message_exception.dart';

class DataLossException extends ExceptionWithMessage {
  DataLossException() : super(message: 'Data is lost');
}
