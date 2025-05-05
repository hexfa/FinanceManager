import 'package:intl/intl.dart';

class ConvertString {
  static String formatDate(DateTime date) {
    return DateFormat('yyyy/MM/dd').format(date);
  }

  static String formatCurrency(String input) {
    if (input.isEmpty) return '';
    final number = int.tryParse(input.replaceAll(',', '')) ?? 0;
    final formatter = NumberFormat('#,###');
    return formatter.format(number);
  }

  static double toDouble(String value) {
    return double.tryParse(value.replaceAll(',', '')) ?? 0.0;
  }
}
