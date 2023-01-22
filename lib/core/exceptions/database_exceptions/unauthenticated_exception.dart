import '../exception_with_message_exception.dart';

class UnauthenticatedException extends ExceptionWithMessage {
  UnauthenticatedException() : super(message: 'User is unauthenticated');
}
