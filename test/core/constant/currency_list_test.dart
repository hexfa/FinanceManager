import 'package:finance_manager/core/constants/currency.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CurrencyCodeExtension', () {
    test('returns correct Currency for valid code', () {
      expect('EUR'.toCurrency().name, 'Euro');
      expect('JPY'.toCurrency().name, 'Japanese Yen');
    });

    test('returns USD Currency for unknown code', () {
      expect('XYZ'.toCurrency().code, 'USD');
      expect('XYZ'.toCurrency().name, 'US Dollar');
    });
  });
}
