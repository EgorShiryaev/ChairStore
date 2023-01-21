import '../../../logic/models/user_data.dart';
import '../exception_with_message_exception.dart';

class ExceptionWithUserData extends ExceptionWithMessage {
  final UserData? user;
  ExceptionWithUserData({this.user, required super.message});
}
