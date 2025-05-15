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

    test('formatCurrencyFromDouble formats double values with commas', () {
      expect(ConvertString.formatCurrencyFromDouble(1000), '1,000');
      expect(ConvertString.formatCurrencyFromDouble(1234567.89), '1,234,568'); // rounded
      expect(ConvertString.formatCurrencyFromDouble(0), '0');
    });

    test('toDouble parses numeric strings with commas to double', () {
      expect(ConvertString.toDouble('1,000'), 1000.0);
      expect(ConvertString.toDouble('123456.78'), 123456.78);
      expect(ConvertString.toDouble(''), 0.0);
      expect(ConvertString.toDouble('abc'), 0.0);
    });
  });
}
