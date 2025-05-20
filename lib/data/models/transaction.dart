import 'package:finance_manager/core/constants/currency_list.dart';
import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/service/currency_service.dart';

class Transaction {
  final int? id;
  final String title;
  final double _amount;
  final TransactionType type;
  final CategoryType category;
  final DateTime date;

  Transaction({
    this.id,
    required this.title,
    required double amount,
    required this.type,
    required this.category,
    required this.date,
  }) : _amount = amount;

  double get amount {
    final currency = CurrencyService().currencyCode;
    final rate = exchangeRates[currency] ?? 1.0;
    return _amount * rate;
  }
}
