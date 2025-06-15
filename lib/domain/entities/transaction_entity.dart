import 'package:finance_manager/data/models/category.dart';
import 'package:hive/hive.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';

@HiveType(typeId: 0)
class TransactionEntity extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String description;

  @HiveField(2)
  late double amount;

  @HiveField(3)
  late TransactionType type;

  @HiveField(4)
  late Category category;

  @HiveField(5)
  late DateTime date;

  TransactionEntity({
    required this.title,
    required this.description,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
  });
}
