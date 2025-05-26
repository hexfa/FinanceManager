import 'package:finance_manager/data/models/transaction_chart_data.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/base/base_bloc_state.dart';

abstract class HomeState extends BaseBlocState {}

final class HomeInitial extends HomeState {}

final class InitialData extends HomeState {
  final List<TransactionChartData> dataList;
  final List<Transaction> transactionList;
  final double income;
  final double expense;
  final double balance;
  final int transactionLength;

  InitialData(
    this.dataList,
    this.transactionList,
    this.income,
    this.expense,
    this.balance,
    this.transactionLength,
  );

  @override
  List<Object?> get props => [
    dataList,
    transactionList,
    income,
    expense,
    balance,
    transactionLength,
  ];
}
