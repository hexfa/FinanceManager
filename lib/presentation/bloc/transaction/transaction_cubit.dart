import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/presentation/bloc/base/base_cubit.dart';
import 'transaction_state.dart';

class TransactionCubit extends BaseCubit<TransactionState> {
  TransactionCubit() : super(const TransactionState());

  void updateTitle(String title) => safeEmit(state.copyWith(title: title));
}
