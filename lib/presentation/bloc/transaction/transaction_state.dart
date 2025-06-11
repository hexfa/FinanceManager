import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/category.dart';
import 'package:finance_manager/presentation/bloc/base/base_bloc_state.dart';

class TransactionState extends BaseBlocState {
  final String title;
  final String description;
  final String amount;
  final Category category;

  final DateTime? date;
  final TransactionType type;

  const TransactionState({
    this.title = '',
    this.description = '',
    this.amount = '',
    this.category = const Category(id: 0, name: ''),
    this.date,
    this.type = TransactionType.income,
  });

  TransactionState copyWith({
    String? title,
    String? description,
    String? amount,
    Category? category,
    DateTime? date,
    TransactionType? type,
  }) {
    return TransactionState(
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      date: date ?? this.date,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [title, description, amount, category, date, type];
}
