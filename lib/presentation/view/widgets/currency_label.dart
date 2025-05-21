import 'package:finance_manager/core/utils/convert_string.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class CurrencyLabel extends BaseStatelessWidget {
  final IconData icon;
  final double balance;

  const CurrencyLabel({super.key, required this.icon, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: theme(context).colorScheme.onSurface),
        const SizedBox(width: 8),

        Text(
          ConvertString.formatCurrencyFromDouble(balance),
          style: theme(context).textTheme.titleLarge?.copyWith(
            color: theme(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
