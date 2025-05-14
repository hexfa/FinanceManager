import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/core/utils/convert_string.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/domain/repositories/transaction_repository.dart';
import 'package:finance_manager/presentation/bloc/base/base_cubit.dart';
import 'transaction_state.dart';

class TransactionCubit extends BaseCubit<TransactionState> {
  final TransactionRepository transactionRepository;

  TransactionCubit({required this.transactionRepository})
    : super(const TransactionState());

  void updateTitle(String title) => safeEmit(state.copyWith(title: title));

  void updateAmount(String amount) => safeEmit(state.copyWith(amount: amount));

  void updateCategory(String category) =>
      safeEmit(state.copyWith(category: category));

  void updateDate(DateTime date) => safeEmit(state.copyWith(date: date));

  void updateType(TransactionType type) => safeEmit(state.copyWith(type: type));

  Future<void> createTransaction() async {
    await transactionRepository.createTransaction(
      transaction: Transaction(
        title: state.title,
        amount: ConvertString.toDouble(state.amount),
        category: state.category.toCategoryType(),
        date: state.date ?? DateTime.now(),
        type: state.type,
      ),
    );
  }

  Future<void> updateTransaction(int transactionId) async {
    final updatedTransaction = Transaction(
      id: transactionId,
      title: state.title,
      amount: ConvertString.toDouble(state.amount),
      category: state.category.toCategoryType(),
      date: state.date ?? DateTime.now(),
      type: state.type,
    );

    await transactionRepository.updateTransaction(
      transaction: updatedTransaction,
    );
  }

  Future<void> deleteTransaction(int id) async {
    await transactionRepository.deleteTransaction(id);
  }
}
