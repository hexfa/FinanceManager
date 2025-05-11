import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/view/screens/transaction/base_transaction_screen.dart';
import 'package:flutter/material.dart';

class UpdateTransactionScreen extends BaseTransactionScreen {
  final Transaction transaction;

  const UpdateTransactionScreen({super.key, required this.transaction});

  @override
  String get appBarTitle => 'Update Transaction';

  @override
  String get actionButtonText => 'Update';

  @override
  VoidCallback get onActionPressed => () {
    // context.read<TransactionCubit>().updateTransaction(transaction.id);
    // Navigator.of(context).pop();
  };

  @override
  State<StatefulWidget> createState() => _UpdateTransactionScreenState();
}

class _UpdateTransactionScreenState
    extends BaseTransactionScreenState<UpdateTransactionScreen> {
  @override
  void initState() {
    super.initState();

    final txn = widget.transaction;
    titleController.text = txn.title;
    amountController.text = txn.amount.toString();

    getBloc<TransactionCubit>()
      ..updateTitle(txn.title)
      ..updateAmount(txn.amount.toString())
      ..updateCategory(txn.category.name)
      ..updateDate(txn.date)
      ..updateType(txn.type);
  }
}
