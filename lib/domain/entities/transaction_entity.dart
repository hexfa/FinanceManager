import 'package:hive/hive.dart';
import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';

// part 'transaction_db_model.g.dart';

@HiveType(typeId: 0)
class TransactionEntity extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late double amount;

  @HiveField(3)
  late TransactionType type;

  @HiveField(4)
  late CategoryType category;

  @HiveField(5)
  late DateTime date;

  TransactionEntity({
    required this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
  });
}
