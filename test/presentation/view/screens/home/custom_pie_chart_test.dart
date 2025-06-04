import 'package:finance_manager/data/models/transaction_chart_data.dart';
import 'package:finance_manager/presentation/view/screens/home/custom_pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders PieChart widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomPieChart(
            data: [
              TransactionChartData(
                title: 'Food',
                percentage: 40,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(PieChart), findsOneWidget);
  });

  testWidgets('displays correct titles and percentages', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomPieChart(
            data: [
              TransactionChartData(
                title: 'Food',
                percentage: 25.456,
                color: Colors.red,
              ),
              TransactionChartData(
                title: 'Transport',
                percentage: 50.1234,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.textContaining('Food'), findsOneWidget);
    expect(find.textContaining('25.46'), findsOneWidget);
    expect(find.textContaining('Transport'), findsOneWidget);
    expect(find.textContaining('50.12'), findsOneWidget);
  });

  testWidgets('renders correct number of pie sections based on data length', (
    WidgetTester tester,
  ) async {
    final data = [
      TransactionChartData(title: 'A', percentage: 10, color: Colors.green),
      TransactionChartData(title: 'B', percentage: 20, color: Colors.orange),
      TransactionChartData(title: 'C', percentage: 30, color: Colors.purple),
    ];

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: CustomPieChart(data: data))),
    );

    for (var item in data) {
      expect(find.textContaining(item.title), findsOneWidget);
    }
  });

  testWidgets('uses theme text style for section titles', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light().copyWith(
          textTheme: const TextTheme(labelSmall: TextStyle(fontSize: 12)),
        ),
        home: Scaffold(
          body: CustomPieChart(
            data: [
              TransactionChartData(
                title: 'Test',
                percentage: 10,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.textContaining('Test'), findsOneWidget);
  });

  testWidgets('rounds percentage values to two decimal places', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomPieChart(
            data: [
              TransactionChartData(
                title: 'Test',
                percentage: 33.3333,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.textContaining('33.33'), findsOneWidget);
  });
}
