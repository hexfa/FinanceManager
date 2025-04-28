import 'package:finance_manager/presentation/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends BaseStatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String balance = '\$2,455';
    String income = '\$1,500';
    String expense = '\$343,0';
    return Scaffold(
      backgroundColor: theme(context).colorScheme.surface,
      appBar: _homeAbbBar(),
      body: Center(
        child: Column(
          children: [
            Text(balance, style: theme(context).textTheme.titleLarge),
            Row(
              children: [
                _buildIncomeExpenseTile(
                  title: 'Income',
                  subtitle: income,
                  icon: Icons.arrow_upward,
                  theme: theme(context),
                ),
                _buildIncomeExpenseTile(
                  title: 'Expense',
                  subtitle: expense,
                  icon: Icons.arrow_downward,
                  theme: theme(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget _homeAbbBar() {
  return AppBar(
    centerTitle: false,
    title: Row(
      children: [
        Icon(Icons.currency_exchange),
        SizedBox(width: 8),
        Text('Balance'),
      ],
    ),
    actions: [
      PopupMenuButton<String>(
        onSelected: (String value) {},
        icon: Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) {
          return {'Setting'}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Row(
                children: [
                  Icon(Icons.settings),
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

Widget _buildIncomeExpenseTile({
  required String title,
  required String subtitle,
  required IconData icon,
  required ThemeData theme,
}) {
  return Expanded(
    child: ListTile(
      leading: Icon(icon, color: theme.colorScheme.secondary),
      title: Text(title, style: theme.textTheme.titleSmall),
      subtitle: Text(subtitle, style: theme.textTheme.titleMedium),
    ),
  );
}
