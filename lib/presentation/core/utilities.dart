import 'package:intl/intl.dart';

String extractHourWithPrefixFromDateTime(DateTime dateTime) {
  var formatter = DateFormat('hh:mm aaa');
  return formatter.format(dateTime);
}
