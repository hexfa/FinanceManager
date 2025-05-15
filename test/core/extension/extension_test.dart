import 'package:finance_manager/core/extension/extension.dart';
import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/domain/entities/transaction_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('TransactionEntity toModel returns correct Transaction', () {
    final entity = TransactionEntity(
      title: 'Lunch',
      amount: 50.0,
      type: TransactionType.expense,
      category: CategoryType.business,
      date: DateTime(2024, 1, 1),
    );

    final model = entity.toModel();

    expect(model.title, entity.title);
    expect(model.amount, entity.amount);
    expect(model.type, entity.type);
    expect(model.category, entity.category);
    expect(model.date, entity.date);
  });

  test('Transaction toEntity returns correct TransactionEntity', () {
    final model = Transaction(
      id: 1,
      title: 'Lunch',
      amount: 50.0,
      type: TransactionType.expense,
      category: CategoryType.business,
      date: DateTime(2024, 1, 1),
    );

    final entity = model.toEntity();

    expect(entity.title, model.title);
    expect(entity.amount, model.amount);
    expect(entity.type, model.type);
    expect(entity.category, model.category);
    expect(entity.date, model.date);
  });
}
