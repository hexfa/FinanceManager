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

  testWidgets('shows correct last update text', (WidgetTester tester) async {
    const lastUpdateText = '5 minutes ago';

    await tester.pumpWidget(
      MaterialApp(
        home: WalletCard(
          balance: 0,
          income: 0,
          expense: 0,
          lastUpdate: lastUpdateText,
        ),
      ),
    );

    expect(find.text('Updated $lastUpdateText'), findsOneWidget);
  });
}
