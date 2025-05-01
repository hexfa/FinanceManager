import 'package:finance_manager/core/utils/convert_date.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class TransactionTile extends BaseStatelessWidget {
  final List<Transaction> data;

  const TransactionTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final transaction = data[index];
        return ListTile(
          leading:
              transaction.type == TransactionType.income
                  ? Icon(Icons.add_a_photo_outlined)
                  : Icon(Icons.add),
          title: Text(
            transaction.title,
            style: theme(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            ConvertDate.formatDate(transaction.date),
            style: theme(context).textTheme.labelMedium?.copyWith(
              color: theme(context).colorScheme.tertiary,
            ),
          ),
          trailing: Text(transaction.amount.toString()),
        );
      },
    );
  }
}
