import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/mapper/mapper.dart';
import 'package:finance_manager/domain/repositories/transaction_repository.dart';
import 'package:finance_manager/presentation/bloc/base/base_cubit.dart';
import 'package:finance_manager/presentation/bloc/home/home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final TransactionRepository transactionRepository;

  HomeCubit({required this.transactionRepository}) : super(HomeInitial());

  Future<void> loadInitialData() async {
    final transactions = await transactionRepository.getAllTransactions();

    final income = transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .fold<double>(0, (sum, transaction) => sum + transaction.amount);

    final expense = transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .fold<double>(0, (sum, transaction) => sum + transaction.amount);

    final balance = income - expense;

    emit(
      InitialData(
        TransactionMapper.toChartData(transactions),
        transactions.take(10).toList(),
        income,
        expense,
        balance,
      ),
    );
  }
}
