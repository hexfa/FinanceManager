import 'package:finance_manager/presentation/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class IncomeExpenseSummary extends BaseStatelessWidget {
  final String income;
  final String expense;

  const IncomeExpenseSummary({
    super.key,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: theme(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme(context).colorScheme.onSurface),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIncomeExpenseTile(
              title: localization(context).income,
              subtitle: income,
              icon: Icons.arrow_upward,
              theme: theme(context),
            ),
            Container(
              width: 1,
              height: 50,
              color: theme(context).colorScheme.onSurface,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            _buildIncomeExpenseTile(
              title: localization(context).expense,
              subtitle: expense,
              icon: Icons.arrow_downward,
              theme: theme(context),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildIncomeExpenseTile({
  required String title,
  required String subtitle,
  required IconData icon,
  required ThemeData theme,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, color: theme.colorScheme.secondary),
      const SizedBox(height: 8),
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: theme.textTheme.titleSmall),
            const SizedBox(width: 8),
            Text(subtitle, style: theme.textTheme.titleMedium),
          ],
        ),
      ),
    ],
  );
}
