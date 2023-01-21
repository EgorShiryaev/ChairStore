import '../exception_with_message_exception.dart';

class DeadlineExceededException extends ExceptionWithMessage {
  DeadlineExceededException() : super(message: 'Access deadline exceeded');
}
