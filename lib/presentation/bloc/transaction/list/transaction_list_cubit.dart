import 'package:finance_manager/domain/repositories/transaction_repository.dart';
import 'package:finance_manager/presentation/bloc/base/base_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/list/transaction_list_state.dart';

class TransactionListCubit extends BaseCubit<TransactionListState> {
  final TransactionRepository transactionRepository;

  TransactionListCubit({required this.transactionRepository})
    : super(TransactionListState());

  Future<void> loadInitialData() async {
    emit(
      TransactionListState(
        transactionList: await transactionRepository.getAllTransactions(),
      ),
    );
  }
}
