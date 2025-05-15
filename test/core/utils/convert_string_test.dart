import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:finance_manager/core/utils/convert_string.dart';

void main() {

  group('ConvertString', () {
    test('formatDate formats DateTime correctly', () {
      final date = DateTime(2024, 5, 15);
      final result = ConvertString.formatDate(date);
      expect(result, '2024/05/15');
    });
  });
}
