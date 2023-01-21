import '../exception_with_message_exception.dart';

class EmailAlreadyInUseException extends ExceptionWithMessage {
  EmailAlreadyInUseException()
      : super(
          message: 'The email address is already in use by another account',
        );
}
