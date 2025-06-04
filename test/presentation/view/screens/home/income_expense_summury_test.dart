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
}
