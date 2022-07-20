import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDate(DateTime date, [
    String? format,
    String? locale,
  ]) {
    return DateFormat(format, locale).format(date);
  }
}