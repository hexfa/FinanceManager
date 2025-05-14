import 'package:finance_manager/data/models/transaction.dart';

abstract class TransactionRepository {
  Future<void> createTransaction({required Transaction transaction});

  Future<List<Transaction>> getAllTransactions();

  Future<void> updateTransaction({required Transaction transaction});

  Future<void> deleteTransaction(int id);

  Future<Transaction?> getTransactionById(int id);
}
