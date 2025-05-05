import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/domain/entities/transaction_entity.dart';

extension TransactionMapper on Transaction {
  TransactionEntity toDb() {
    return TransactionEntity()
      ..id = id
      ..title = title
      ..amount = amount
      ..type = type
      ..category = category
      ..date = date;
  }

  static Transaction fromDb(TransactionEntity dbModel) {
    return Transaction(
      title: dbModel.title,
      amount: dbModel.amount,
      type: dbModel.type,
      category: dbModel.category,
      date: dbModel.date,
    );
  }
}
