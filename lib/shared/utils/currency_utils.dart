import 'package:intl/intl.dart';

class CurrencyUtils {
  static String formatCurrency({
    required num value,
    int? decimalDigits,
    String? locale,
    String? symbol,
  }) {
    return NumberFormat.currency(
      decimalDigits: decimalDigits,
      locale: locale,
      symbol: symbol,
    ).format(value);
  }
}