import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/base/base_bloc_state.dart';

class TransactionDetailState extends BaseBlocState {
  final Transaction? transaction;

  const TransactionDetailState({this.transaction});

  TransactionDetailState copyWith({Transaction? transaction}) {
    return TransactionDetailState(transaction: transaction ?? this.transaction);
  }
}
