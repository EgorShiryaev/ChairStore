import '../exception_with_message_exception.dart';

class NotFoundException extends ExceptionWithMessage {
  NotFoundException() : super(message: 'Record not found');
}
