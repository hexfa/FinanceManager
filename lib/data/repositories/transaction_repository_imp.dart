import 'package:finance_manager/core/extension/extension.dart';
import 'package:finance_manager/data/datasource/db_data_source.dart';
import 'package:finance_manager/data/mapper/mapper.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final DBDataSource dataSource;

  TransactionRepositoryImpl(this.dataSource);

  @override
  Future<List<Transaction>> getAllTransactions() async {
    final list = await dataSource.getAll();
    return TransactionMapper.toModelList(list);
  }

  @override
  Future<void> createTransaction({required Transaction transaction}) async {
    await dataSource.create(transaction.toEntity());
  }

  @override
  Future<void> updateTransaction({required Transaction transaction}) async {
    await dataSource.update(transaction.id ?? -1, transaction.toEntity());
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await dataSource.delete(id);
  }

  @override
  Future<Transaction?> getTransactionById(int id) async {
    final entity = await dataSource.getById(id);
    return entity?.toModel();
  }
}
