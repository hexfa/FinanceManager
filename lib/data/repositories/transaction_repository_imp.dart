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
    return transactions.map((entity) => entity.toModel()).toList();
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
}
