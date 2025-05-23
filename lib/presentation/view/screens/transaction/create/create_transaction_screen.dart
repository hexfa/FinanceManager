import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/view/screens/transaction/base/base_create_update_transaction.dart';
import 'package:flutter/material.dart';

class CreateTransactionScreen extends BaseTransactionScreen {
  const CreateTransactionScreen({super.key});

  @override
  String get appBarTitle => 'Add Transaction';

  @override
  String get actionButtonText => 'Create';

  @override
  State<StatefulWidget> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState
    extends BaseTransactionScreenState<CreateTransactionScreen> {
  @override
  VoidCallback get onActionPressed => () {
    getBloc<TransactionCubit>().createTransaction();
    navigator.pop();
  };

  @override
  String get categoryLabel => 'Category';

  @override
  DateTime get dateLabel => DateTime.now();
}
