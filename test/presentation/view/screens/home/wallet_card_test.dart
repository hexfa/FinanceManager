import 'package:finance_manager/presentation/view/screens/home/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('displays correct balance in CurrencyLabel', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WalletCard(
          balance: 1234.56,
          income: 0,
          expense: 0,
          lastUpdate: '2h ago',
        ),
      ),
    );

    expect(find.textContaining('1234.56'), findsOneWidget);
  });
}
