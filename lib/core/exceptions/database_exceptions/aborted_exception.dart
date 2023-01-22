import '../exception_with_message_exception.dart';

class AbortedException extends ExceptionWithMessage {
  AbortedException() : super(message: 'Request is aborted');
}
