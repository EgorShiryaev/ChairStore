import 'auth_exceptions/exception_with_user_data.dart';

class TechnicalException extends ExceptionWithUserData {
  TechnicalException({super.user})
      : super(message: 'Oops, something went wrong. Please try later');
}
