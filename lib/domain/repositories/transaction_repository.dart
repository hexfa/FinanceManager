import 'package:finance_manager/core/utils/transaction_type.dart';

abstract class TransactionRepository {
  Future<void> createTransaction({
    required String title,
    required String amount,
    required String category,
    required DateTime date,
    required TransactionType type,
  });
}
