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

    test('formatCurrencyFromString formats numeric strings correctly', () {
      expect(ConvertString.formatCurrencyFromString('1000'), '1,000');
      expect(ConvertString.formatCurrencyFromString('1000000'), '1,000,000');
      expect(ConvertString.formatCurrencyFromString(''), '');
      expect(ConvertString.formatCurrencyFromString('abc'), '0');
      expect(ConvertString.formatCurrencyFromString('1,234'), '1,234'); // already formatted
    });
  });
}
