import '../exception_with_message_exception.dart';

class PermissionDeniedException extends ExceptionWithMessage {
  PermissionDeniedException() : super(message: 'Permission denied');
}
