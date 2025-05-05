import 'package:finance_manager/data/models/transaction.dart';

abstract class TransactionRepository {
  Future<void> createTransaction({required Transaction transaction});
}
