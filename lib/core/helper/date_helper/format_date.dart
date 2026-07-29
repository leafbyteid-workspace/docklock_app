import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat(
    "dd MMM yyyy • HH:mm",
  ).format(date);
}