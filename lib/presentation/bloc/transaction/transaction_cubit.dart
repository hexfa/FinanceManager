import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/domain/repositories/transaction_repository.dart';
import 'package:finance_manager/presentation/bloc/base/base_cubit.dart';
import 'transaction_state.dart';

class TransactionCubit extends BaseCubit<TransactionState> {
  final TransactionRepository repository;

  TransactionCubit(this.repository) : super(const TransactionState());

  void updateTitle(String title) => safeEmit(state.copyWith(title: title));

  void updateAmount(String amount) => safeEmit(state.copyWith(amount: amount));

  void updateCategory(String category) =>
      safeEmit(state.copyWith(category: category));

  void updateDate(DateTime date) => safeEmit(state.copyWith(date: date));

  void updateType(TransactionType type) => safeEmit(state.copyWith(type: type));

  Future<void> createTransaction() async {
    await repository.createTransaction(
      title: state.title,
      amount: state.amount,
      category: state.category,
      date: state.date ?? DateTime.now(),
      type: state.type,
    );
  }
}
