import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/domain/entities/category_entity.dart';
import 'package:finance_manager/domain/entities/transaction_entity.dart';

import '../../data/models/category.dart';

extension TransactionEntityMapper on TransactionEntity {
  Transaction toModel() {
    return Transaction(
      id: key as int,
      title: title,
      description: description,
      amount: amount,
      type: type,
      category: category,
      date: date,
    );
  }
}

extension TransactionModelMapper on Transaction {
  TransactionEntity toEntity() {
    return TransactionEntity(
      title: title,
      description: description,
      amount: amount,
      type: type,
      category: category,
      date: date,
    );
  }
}

extension CategoryMapper on CategoryEntity {
  Category toModel() => Category(id: key as int, name: name);
}

extension CategoryModelMapper on Category {
  CategoryEntity toEntity() => CategoryEntity(name: name);
}
