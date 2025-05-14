import 'package:finance_manager/core/extension/extension.dart';
import 'package:finance_manager/data/mapper/mapper.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/domain/entities/transaction_entity.dart';
import 'package:finance_manager/domain/repositories/transaction_repository.dart';
import 'package:hive/hive.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final _db = Hive.box<TransactionEntity>('transactions');

  @override
  Future<List<Transaction>> getAllTransactions() async {
    return TransactionMapper.toModelList(_db.values.toList());
  }

  @override
  Future<void> createTransaction({required Transaction transaction}) async {
    await _db.add(transaction.toEntity());
  }

  @override
  Future<void> updateTransaction({required Transaction transaction}) async {
    await _db.put(transaction.id, transaction.toEntity());
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await _db.delete(id);
  }

  @override
  Future<Transaction?> getTransactionById(int id) async {
    final entity = _db.get(id);
    if (entity != null) {
      return entity.toModel();
    }
    return null;
  }
}
