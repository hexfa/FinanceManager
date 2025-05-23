import 'package:hive/hive.dart';
import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';

// part 'transaction_db_model.g.dart';

@HiveType(typeId: 0)
class TransactionEntity extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late double amount;

  @HiveField(2)
  late TransactionType type;

  @HiveField(3)
  late CategoryType category;

  @HiveField(4)
  late DateTime date;

  TransactionEntity({
    required this.title,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
  });
}
