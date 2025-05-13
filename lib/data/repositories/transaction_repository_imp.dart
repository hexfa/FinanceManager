import 'package:finance_manager/core/extension/entity_extension.dart';
import 'package:finance_manager/data/mapper/transaction_mapper.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/domain/entities/transaction_entity.dart';
import 'package:finance_manager/domain/repositories/transaction_repository.dart';
import 'package:hive/hive.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final _db = Hive.box<TransactionEntity>('transactions');

  @override
  Future<List<Transaction>> getAllTransactions() async {
    final transactions = _db.values.toList();
    print('------------------- getAllTransactions ${transactions.length}');
    return transactions.map((entity) => entity.toModel()).toList();
  }

  @override
  Future<void> createTransaction({required Transaction transaction}) async {
    await _db.add(transaction.toDb());
  }

  @override
  Future<void> updateTransaction({
    required int id,
    required Transaction transaction,
  }) async {
    final box = Hive.box<TransactionEntity>('transactions');
    await box.put(id, transaction.toDb());
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await _db.delete(id);
  }
}
