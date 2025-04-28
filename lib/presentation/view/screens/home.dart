import 'package:finance_manager/presentation/base/base_stateless_widget.dart';
import 'package:finance_manager/presentation/view/screens/income_expense_summury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends BaseStatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String balance = '\$2,455';
    String income = '\$1,500';
    String expense = '\$343,0';
    return Scaffold(
      backgroundColor: theme(context).colorScheme.surface,
      appBar: _homeAbbBar(theme(context), localization(context)),
      body: Center(
        child: Column(
          children: [
            Text(balance, style: theme(context).textTheme.titleLarge),
            IncomeExpenseSummary(income: income, expense: expense),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget _homeAbbBar(
  ThemeData theme,
  AppLocalizations localization,
) {
  return AppBar(
    backgroundColor: theme.colorScheme.surface,
    centerTitle: false,
    title: Row(
      children: [
        Icon(Icons.currency_exchange, color: theme.colorScheme.onSurface),
        SizedBox(width: 8),
        Text(
          localization.balance,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    ),
    actions: [
      PopupMenuButton<String>(
        onSelected: (String value) {},
        icon: Icon(Icons.more_vert, color: theme.colorScheme.onSurface),
        itemBuilder: (BuildContext context) {
          return {localization.setting}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Row(
                children: [
                  Icon(Icons.settings, color: theme.colorScheme.onSurface),
                  SizedBox(width: 8),
                  Text(choice),
                ],
              ),
            );
          }).toList();
        },
      ),
    ],
  );
}
