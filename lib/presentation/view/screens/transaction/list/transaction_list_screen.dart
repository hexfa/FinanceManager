import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/transaction/list/transaction_list_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/list/transaction_list_state.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:finance_manager/presentation/view/screens/home/transaction_tile.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionListScreen extends BaseStatelessWidget {
  const TransactionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactions = [];

    return BlocBuilder<TransactionListCubit, TransactionListState>(
      builder: (context, state) {
        transactions = state.transactionList;

        return Scaffold(
          appBar: CustomAppBar(
            title: 'Transaction',
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${transactions.length} count',
                  style: theme(context).textTheme.titleMedium?.copyWith(
                    color: theme(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          body: TransactionTile(data: transactions),
        );
      },
    );
  }
}
