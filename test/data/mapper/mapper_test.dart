import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/data/mapper/mapper.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/domain/entities/transaction_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';

void main() {
  test(
    'TransactionMapper converts TransactionEntity list to model list correctly',
    () {
      final entities = [
        TransactionEntity(
          title: 'Test',
          amount: 100,
          category: CategoryType.business,
          date: DateTime.now(),
          type: TransactionType.income,
        ),
      ];

      final models = TransactionMapper.toModelList(entities);

      expect(models.length, entities.length);
      expect(models.first.title, entities.first.title);
    },
  );

  test(
    'TransactionMapper converts Transaction model list to entity list correctly',
    () {
      final models = [
        Transaction(
          id: 1,
          title: 'Test',
          amount: 100,
          category: CategoryType.business,
          date: DateTime.now(),
          type: TransactionType.income,
        ),
      ];

      final entities = TransactionMapper.toEntityList(models);

      expect(entities.length, models.length);
      expect(entities.first.title, models.first.title);
    },
  );
}