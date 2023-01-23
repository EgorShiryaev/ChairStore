import 'index.dart';

class NoInternetConnectionException extends ExceptionWithUserData {
  NoInternetConnectionException({super.user})
      : super(
          message: 'Internet connection not found.'
              ' Please check you connect to Internet and retry',
        );
}
