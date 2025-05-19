import 'package:finance_manager/data/models/currency.dart';

final List<Currency> currencyList = [
  Currency(code: 'USD', name: 'US Dollar'),
  Currency(code: 'EUR', name: 'Euro'),
  Currency(code: 'IRR', name: 'Iranian Rial'),
  Currency(code: 'GBP', name: 'British Pound'),
  Currency(code: 'JPY', name: 'Japanese Yen'),
  Currency(code: 'CHF', name: 'Swiss Franc'),
  Currency(code: 'CAD', name: 'Canadian Dollar'),
  Currency(code: 'AUD', name: 'Australian Dollar'),
  Currency(code: 'NZD', name: 'New Zealand Dollar'),
  Currency(code: 'CNY', name: 'Chinese Yuan'),
  Currency(code: 'SEK', name: 'Swedish Krona'),
  Currency(code: 'NOK', name: 'Norwegian Krone'),
  Currency(code: 'DKK', name: 'Danish Krone'),
  Currency(code: 'INR', name: 'Indian Rupee'),
  Currency(code: 'RUB', name: 'Russian Ruble'),
  Currency(code: 'BRL', name: 'Brazilian Real'),
  Currency(code: 'ZAR', name: 'South African Rand'),
  Currency(code: 'MXN', name: 'Mexican Peso'),
  Currency(code: 'SGD', name: 'Singapore Dollar'),
  Currency(code: 'HKD', name: 'Hong Kong Dollar'),
  Currency(code: 'KRW', name: 'South Korean Won'),
  Currency(code: 'TRY', name: 'Turkish Lira'),
  Currency(code: 'SAR', name: 'Saudi Riyal'),
  Currency(code: 'AED', name: 'UAE Dirham'),
  Currency(code: 'EGP', name: 'Egyptian Pound'),
  Currency(code: 'THB', name: 'Thai Baht'),
  Currency(code: 'PLN', name: 'Polish Zloty'),
  Currency(code: 'CZK', name: 'Czech Koruna'),
  Currency(code: 'MYR', name: 'Malaysian Ringgit'),
  Currency(code: 'IDR', name: 'Indonesian Rupiah'),
  Currency(code: 'PKR', name: 'Pakistani Rupee'),
  Currency(code: 'TWD', name: 'Taiwan Dollar'),
];

extension CurrencyCodeExtension on String {
  Currency toCurrency() {
    return currencyList.firstWhere(
      (currency) => currency.code == this,
      orElse: () => Currency(code: this, name: this),
    );
  }
}