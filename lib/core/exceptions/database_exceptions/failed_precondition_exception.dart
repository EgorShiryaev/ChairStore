import '../exception_with_message_exception.dart';

class FailedPreconditionException extends ExceptionWithMessage {
  FailedPreconditionException() : super(message: 'Failed precondition');
}
