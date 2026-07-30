import 'package:intl/intl.dart';

String formatTanggal(DateTime date) {
  return DateFormat(
    "dd MMM yyyy • HH:mm",
  ).format(date);
}