import '../exception_with_message_exception.dart';

class CancelledException extends ExceptionWithMessage {
  CancelledException() : super(message: 'Request is canceled');
}
