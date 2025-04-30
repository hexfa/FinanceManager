import 'package:finance_manager/data/models/PieData.dart';
import 'package:finance_manager/presentation/base/base_stateless_widget.dart';
import 'package:finance_manager/presentation/view/screens/home/pie_data_list.dart';
import 'package:finance_manager/presentation/view/screens/home/custom_pie_chart.dart';
import 'package:finance_manager/presentation/view/screens/home/income_expense_summury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends BaseStatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PieData> data = [
      PieData(title: 'کار', percentage: 5, color: Colors.blue),
      PieData(title: 'تفریح', percentage: 7, color: Colors.green),
      PieData(title: 'ورزش', percentage: 20, color: Colors.orange),
      PieData(title: 'دیگر', percentage: 17, color: Colors.grey),
      PieData(title: 'مطالعه', percentage: 30, color: Colors.purple),
      PieData(title: 'خواب', percentage: 21, color: Colors.red),
    ];

    String balance = '\$2,455';
    String income = '\$1,500';
    String expense = '\$343,0';
    return Scaffold(
      backgroundColor: theme(context).colorScheme.surface,
      appBar: _homeAbbBar(theme(context), localization(context)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(balance, style: theme(context).textTheme.titleLarge),
              IncomeExpenseSummary(income: income, expense: expense),
              CustomPieChart(data: data),
              Card(
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: PieDataList(data: data),
                ),
              ),
              // PieDataList(data: data),
            ],
          ),
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
