import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/category.dart';

class Transaction {
  final int? id;
  final String title;
  final String description;
  final double _amount;
  final TransactionType type;
  final Category category;
  final DateTime date;

  Transaction({
    this.id,
    required this.title,
    required this.description,
    required double amount,
    required this.type,
    required this.category,
    required this.date,
  }) : _amount = amount;

  double get amount {
    // final currency = CurrencyService().currencyCode;
    // final rate = exchangeRates[currency] ?? 1.0;
    // return _amount * rate;
    return _amount;
  }
}
