import 'package:finance_manager/core/extension/extension.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/domain/entities/transaction_entity.dart';

class TransactionMapper {
  static List<Transaction> toModelList(List<TransactionEntity> entities) {
    return entities
        .map((transactionEntity) => transactionEntity.toModel())
        .toList();
  }

  static List<TransactionEntity> toEntityList(List<Transaction> models) {
    return models.map((transaction) => transaction.toEntity()).toList();
  }
}