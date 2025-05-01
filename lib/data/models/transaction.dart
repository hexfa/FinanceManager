import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:uuid/uuid.dart';

class Transaction {
  final String id = Uuid().v4();
  final String title;
  final double amount;
  final TransactionType type;
  final CategoryType category;
  final DateTime date = DateTime.now();

  Transaction({
    required this.title,
    required this.amount,
    required this.type,
    required this.category,
  });
}
