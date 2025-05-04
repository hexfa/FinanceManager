import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<void> createTransaction({
    required String title,
    required String amount,
    required String category,
    required DateTime date,
    required TransactionType type,
  }) async {
    print("Transaction saved: $title $amount $category $date $type");
  }
}
