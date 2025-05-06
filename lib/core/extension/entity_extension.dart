import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/domain/entities/transaction_entity.dart';

extension TransactionEntityMapper on TransactionEntity {
  Transaction toModel() {
    return Transaction(
      id: id,
      title: title,
      amount: amount,
      type: type,
      category: category,
      date: date,
    );
  }
}
