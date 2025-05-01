import 'package:intl/intl.dart';

class ConvertDate {
  static String formatDate(DateTime date) {
    return DateFormat('yyyy/MM/dd').format(date);
  }
}
