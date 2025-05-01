import 'package:finance_manager/data/models/PieData.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class PieDataList extends BaseStatelessWidget {
  final List<Transaction> data;

  const PieDataList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = data[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(radius: 6, backgroundColor: Colors.green),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.title,
                  style: theme(context).textTheme.bodyMedium?.copyWith(
                    color: theme(context).colorScheme.onSurface,
                  ),
                ),
              ),
              Text(
                '${10}%',
                style: theme(context).textTheme.bodyMedium?.copyWith(
                  color: theme(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
