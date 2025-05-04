import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/presentation/bloc/base/base_bloc_state.dart';

class TransactionState extends BaseBlocState {
  final String title;
  final String amount;
  final String category;
  final DateTime? date;
  final TransactionType? type;

  const TransactionState({
    this.title = '',
    this.amount = '',
    this.category = '',
    this.date,
    this.type,
  });

  TransactionState copyWith({
    String? title,
    String? amount,
    String? category,
    DateTime? date,
    TransactionType? type,
  }) {
    return TransactionState(
      title: title ?? this.title,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      date: date ?? this.date,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [title, amount, category, date, type];
}
