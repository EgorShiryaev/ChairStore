import '../exception_with_message_exception.dart';

class AlreadyExistsException extends ExceptionWithMessage {
  AlreadyExistsException() : super(message: 'Item is already exists');
}
