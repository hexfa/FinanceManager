import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/navigation/route_path.dart';
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

  testWidgets('displays amount with + or - prefix based on transaction type', (
    WidgetTester tester,
  ) async {
    final transactions = [
      Transaction(
        id: 1,
        title: 'food',
        description: '',
        amount: 800,
        type: TransactionType.income,
        category: CategoryType.food,
        date: DateTime.now(),
      ),
      Transaction(
        id: 2,
        title: 'sport',
        description: '',
        amount: 1200,
        type: TransactionType.expense,
        category: CategoryType.sport,
        date: DateTime.now(),
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(home: TransactionTile(data: transactions)),
    );

    expect(find.text('+\$800.0'), findsOneWidget);
    expect(find.text('-\$1200.0'), findsOneWidget);
  });

  testWidgets('displays formatted date from transaction model', (
    WidgetTester tester,
  ) async {
    final transaction = Transaction(
      id: 1,
      title: 'education',
      description: '',
      amount: 50,
      type: TransactionType.expense,
      category: CategoryType.education,
      date: DateTime(2024, 6, 4),
    );

    await tester.pumpWidget(
      MaterialApp(home: TransactionTile(data: [transaction])),
    );

    expect(find.text('2024/06/04'), findsOneWidget);
  });

  testWidgets('navigates to detail page with transaction ID on tap', (
    WidgetTester tester,
  ) async {
    final navigatorKey = GlobalKey<NavigatorState>();

    final transaction = Transaction(
      id: 42,
      title: 'business',
      description: '',
      amount: 75,
      type: TransactionType.expense,
      category: CategoryType.business,
      date: DateTime.now(),
    );

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateRoute: (settings) {
          if (settings.name == RoutePath.transactionDetailRoute) {
            return MaterialPageRoute(
              builder: (_) => Text('Detail for ID: ${settings.arguments}'),
            );
          }
          return null;
        },
        home: TransactionTile(data: [transaction]),
      ),
    );

    await tester.tap(find.text('business'));
    await tester.pumpAndSettle();

    expect(find.text('Detail for ID: 42'), findsOneWidget);
  });
}
