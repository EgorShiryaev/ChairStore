import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';

String convertToUiDate(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  String formattedDate = DateFormat('dd.MM.yy HH:mm').format(dateTime);
  return formattedDate;
}
