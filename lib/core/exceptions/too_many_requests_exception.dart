import 'exception_with_message_exception.dart';

class TooManyRequestsException extends ExceptionWithMessage {
  TooManyRequestsException()
      : super(
          message: 'Too many requests have been made to sign in as this user. '
              'Please try later',
        );
}
