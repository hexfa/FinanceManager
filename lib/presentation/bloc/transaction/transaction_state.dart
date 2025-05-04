import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/presentation/bloc/base/base_bloc_state.dart';

abstract class TransactionState extends BaseBlocState {}

final class TransactionInitial extends TransactionState {}
