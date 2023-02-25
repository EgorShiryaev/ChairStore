import '../../../logic/models/auth_data.dart';
import '../exception_with_message_exception.dart';

class ExceptionWithUserData extends ExceptionWithMessage {
  final AuthData? user;
  ExceptionWithUserData({this.user, required super.message});
}
