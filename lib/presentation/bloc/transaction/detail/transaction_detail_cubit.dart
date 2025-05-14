import 'package:finance_manager/domain/repositories/transaction_repository.dart';
import 'package:finance_manager/presentation/bloc/base/base_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/detail/transaction_detail_state.dart';

class TransactionDetailCubit extends BaseCubit<TransactionDetailState> {
  final TransactionRepository transactionRepository;

  TransactionDetailCubit({required this.transactionRepository})
    : super(const TransactionDetailState());

  Future<void> getTransactionById(int id) async {
    final transaction = await transactionRepository.getTransactionById(id);
    emit(state.copyWith(transaction: transaction));
  }

  Future<void> deleteTransaction(int id) async {
    await transactionRepository.deleteTransaction(id);
  }
}
