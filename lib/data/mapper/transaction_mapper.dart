import 'package:finance_manager/core/extension/extension.dart';
import 'package:finance_manager/core/utils/category.dart';
import 'package:finance_manager/data/models/category.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/data/models/transaction_chart_data.dart';
import 'package:finance_manager/domain/entities/transaction_entity.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';

class TransactionMapper {
  static List<Transaction> toModelList(List<TransactionEntity> entities) {
    return entities
        .map((transactionEntity) => transactionEntity.toModel())
        .toList();
  }

  static List<TransactionEntity> toEntityList(List<Transaction> models) {
    return models.map((transaction) => transaction.toEntity()).toList();
  }

  static List<TransactionChartData> toChartData(
      List<Transaction> transactions,
      ) {
    final expenseTransactions =
    transactions.where((t) => t.type == TransactionType.expense).toList();

    final Map<int, (Category, double)> groupedAmount = {};
    double totalAmount = 0;

    for (var transaction in expenseTransactions) {
      final int key = transaction.category.id;

      if (groupedAmount.containsKey(key)) {
        final current = groupedAmount[key]!;
        groupedAmount[key] = (
        current.$1,
        current.$2 + transaction.amount,
        );
      } else {
        groupedAmount[key] = (
        transaction.category,
        transaction.amount,
        );
      }

      totalAmount += transaction.amount;
    }

    return groupedAmount.values.map((entry) {
      final category = entry.$1;
      final amount = entry.$2;
      final double percentage = totalAmount > 0 ? (amount / totalAmount) * 100 : 0;

      return TransactionChartData(
        title: category.name,
        percentage: percentage,
        color: CategoryUtils.getCategoryColor(category),
      );
    }).toList();
  }
}
