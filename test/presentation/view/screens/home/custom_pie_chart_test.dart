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
}
