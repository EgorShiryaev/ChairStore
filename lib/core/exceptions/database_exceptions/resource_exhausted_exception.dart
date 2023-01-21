import '../exception_with_message_exception.dart';

class ResourceExhaustedException extends ExceptionWithMessage {
  ResourceExhaustedException() : super(message: 'Resource exhausted');
}
