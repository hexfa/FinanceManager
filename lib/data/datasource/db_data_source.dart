import 'package:finance_manager/domain/entities/transaction_entity.dart';
import 'package:hive/hive.dart';

class DBDataSource {
  final Box<TransactionEntity> _db;

  DBDataSource(this._db);

  Future<List<TransactionEntity>> getAll() async => _db.values.toList();

  Future<void> create(TransactionEntity entity) async => await _db.add(entity);

  Future<void> update(int id, TransactionEntity entity) async =>
      await _db.put(id, entity);

  Future<void> delete(int id) async => await _db.delete(id);

  Future<TransactionEntity?> getById(int id) async => _db.get(id);
}
