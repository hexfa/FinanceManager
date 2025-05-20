import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/base/base_bloc_state.dart';

class TransactionListState extends BaseBlocState {
  List<Transaction> transactionList;

  TransactionListState({this.transactionList = const []});

  @override
  List<Object?> get props => [transactionList];
}
