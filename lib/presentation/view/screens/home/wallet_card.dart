import 'package:finance_manager/core/utils/convert_string.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:finance_manager/presentation/view/screens/home/income_expense_summury.dart';
import 'package:finance_manager/presentation/view/widgets/currency_label.dart';
import 'package:flutter/material.dart';

class WalletCard extends BaseStatelessWidget {
  final double balance;
  final double income;
  final double expense;
  final String lastUpdate;

  const WalletCard({
    super.key,
    required this.balance,
    required this.income,
    required this.expense,
    required this.lastUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CurrencyLabel(icon: Icons.currency_exchange, balance: balance),
            const SizedBox(height: 8),
            Text(
              'Updated $lastUpdate',
              style: theme(context).textTheme.labelMedium?.copyWith(
                color: theme(context).colorScheme.tertiaryContainer,
              ),
            ),
            const SizedBox(height: 16),
            IncomeExpenseSummary(
              income: ConvertString.formatCurrencyFromDouble(income),
              expense: ConvertString.formatCurrencyFromDouble(expense),
            ),
          ],
        ),
      ),
    );
  }
}
