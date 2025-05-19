import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/view/screens/transaction/base/base_create_update_transaction.dart';
import 'package:flutter/material.dart';

class UpdateTransactionScreen extends BaseTransactionScreen {
  final Transaction transaction;

  const UpdateTransactionScreen({super.key, required this.transaction});

  @override
  String get appBarTitle => 'Update Transaction';

  @override
  String get actionButtonText => 'Update';

  @override
  State<StatefulWidget> createState() => _UpdateTransactionScreenState();
}

class _UpdateTransactionScreenState
    extends BaseTransactionScreenState<UpdateTransactionScreen> {
  @override
  void initState() {
    super.initState();
    final updateTransaction = widget.transaction;
    titleController.text = updateTransaction.title;
    amountController.text = updateTransaction.amount.toString();

    getBloc<TransactionCubit>()
      ..updateTitle(updateTransaction.title)
      ..updateAmount(updateTransaction.amount.toString())
      ..updateCategory(updateTransaction.category.name)
      ..updateDate(updateTransaction.date)
      ..updateType(updateTransaction.type);
  }

  @override
  VoidCallback get onActionPressed => () {
    getBloc<TransactionCubit>().updateTransaction(widget.transaction.id ?? -1);
    navigator.pop();
  };

  @override
  String get categoryLabel => widget.transaction.category.name;

  @override
  DateTime get dateLabel => widget.transaction.date;
}
