import 'package:finance_manager/core/extension/extension.dart';
import 'package:finance_manager/core/utils/category_color.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/data/models/transaction_chart_data.dart';
import 'package:finance_manager/domain/entities/transaction_entity.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/core/utils/category_type.dart';

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

    final Map<CategoryType, double> groupedAmount = {};
    double totalAmount = 0;

    for (var transaction in expenseTransactions) {
      groupedAmount[transaction.category] =
          (groupedAmount[transaction.category] ?? 0) + transaction.amount;
      totalAmount += transaction.amount;
    }

    return groupedAmount.entries.map((entry) {
      final category = entry.key;
      final amount = entry.value;
      double percentage = totalAmount > 0 ? (amount / totalAmount) * 100 : 0;

      return TransactionChartData(
        title: category.name,
        percentage: percentage,
        color: CategoryColor.getCategoryColor(category),
      );
    }).toList();
  }
}
