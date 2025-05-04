import 'package:bloc/bloc.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());
}
