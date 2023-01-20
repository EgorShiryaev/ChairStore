import 'exception_with_user_data.dart';

class TooManyRequestsException extends ExceptionWithUserData {
  TooManyRequestsException({super.user})
      : super(
          message: 'Too many requests have been made to sign in as this user. '
              'Please try later',
        );
}
