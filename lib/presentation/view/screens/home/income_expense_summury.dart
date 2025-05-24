import 'package:finance_manager/gen/assets.gen.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        decoration: BoxDecoration(
          color: theme(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIncomeExpenseTile(
              title: localization(context).income,
              subtitle: income,
              iconPath: Assets.icons.income,
              iconColor: Colors.green,
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
              iconPath: Assets.icons.expense,
              iconColor: Colors.red,
              theme: theme(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncomeExpenseTile({
    required String title,
    required String subtitle,
    required String iconPath,
    required Color iconColor,
    required ThemeData theme,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        getIcon(iconPath, color: iconColor),
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
}
