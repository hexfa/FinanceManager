import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/view/screens/transaction/base/base_create_update_transaction.dart';
import 'package:flutter/material.dart';

class CreateTransactionScreen extends BaseTransactionScreen {
  const CreateTransactionScreen({super.key});

  @override
  String get appBarTitle => 'Add Transaction';

  @override
  String get actionButtonText => 'Save';

  @override
  State<StatefulWidget> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState
    extends BaseTransactionScreenState<CreateTransactionScreen> {
  @override
  VoidCallback get onActionPressed => () {
    getBloc<TransactionCubit>().createTransaction();
    Navigator.of(context).pop();
  };
}
