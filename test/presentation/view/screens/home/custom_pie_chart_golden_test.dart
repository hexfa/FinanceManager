import 'package:finance_manager/presentation/view/screens/home/custom_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:finance_manager/data/models/transaction_chart_data.dart';

void main() {
  testGoldens('CustomPieChart golden test', (WidgetTester tester) async {
    final data = [
      TransactionChartData(title: 'Food', percentage: 40, color: Colors.red),
      TransactionChartData(
        title: 'Transport',
        percentage: 30,
        color: Colors.blue,
      ),
      TransactionChartData(title: 'Bills', percentage: 30, color: Colors.green),
    ];

    final builder =
        GoldenBuilder.column()
          ..addScenario('CustomPieChart basic', CustomPieChart(data: data));

    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: const Size(300, 250),
    );

    await screenMatchesGolden(tester, 'custom_pie_chart');
  });
}
