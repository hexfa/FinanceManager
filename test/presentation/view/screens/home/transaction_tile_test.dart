import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/view/screens/home/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('displays transaction titles correctly', (
    WidgetTester tester,
  ) async {
    final transactions = [
      Transaction(
        id: 1,
        title: 'food',
        description: '',
        amount: 5000,
        type: TransactionType.income,
        category: CategoryType.food,
        date: DateTime(2024, 5, 1),
      ),
      Transaction(
        id: 2,
        title: 'sport',
        description: '',
        amount: 300,
        type: TransactionType.expense,
        category: CategoryType.sport,
        date: DateTime(2024, 5, 2),
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(home: TransactionTile(data: transactions)),
    );

    expect(find.text('food'), findsOneWidget);
    expect(find.text('sport'), findsOneWidget);
  });
}
