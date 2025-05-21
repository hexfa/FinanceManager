import 'package:finance_manager/data/models/pie_data.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/base/base_bloc_state.dart';

abstract class HomeState extends BaseBlocState {}

final class HomeInitial extends HomeState {}

final class InitialData extends HomeState {
  final List<PieData> dataList;
  final List<Transaction> transactionList;
  final double income;
  final double expense;
  final double balance;

  InitialData(
    this.dataList,
    this.transactionList,
    this.income,
    this.expense,
    this.balance,
  );

  @override
  List<Object?> get props => [
    dataList,
    transactionList,
    income,
    expense,
    balance,
  ];
}
