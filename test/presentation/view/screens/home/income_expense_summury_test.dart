import 'package:finance_manager/presentation/view/screens/home/income_expense_summury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('displays income and expense values', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: IncomeExpenseSummary(income: '2000 \$', expense: '1500 \$'),
      ),
    );

    expect(find.text('2000 \$'), findsOneWidget);
    expect(find.text('1500 \$'), findsOneWidget);
  });

  testWidgets('shows a separator between income and expense', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: IncomeExpenseSummary(income: '1000', expense: '500')),
    );

    expect(find.byKey(const Key('income_expense_separator')), findsOneWidget);
  });

  testWidgets('displays icons for income and expense', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: IncomeExpenseSummary(income: '1000', expense: '500')),
    );

    expect(find.byType(Image), findsWidgets);
  });

  testWidgets('contains two income/expense sections', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: IncomeExpenseSummary(income: '1000', expense: '500')),
    );

    final columnCount = find.byType(Column);
    expect(columnCount, findsNWidgets(2));
  });
}
