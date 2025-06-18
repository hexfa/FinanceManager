import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/presentation/view/widgets/choicechip/custom_type_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('displays both income and expense chips', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomTypeSelector(
          selectedType: TransactionType.income,
          onChanged: (_) {},
        ),
      ),
    );

    expect(find.text('income'), findsOneWidget);
    expect(find.text('expense'), findsOneWidget);
  });

  testWidgets('highlights selected type', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomTypeSelector(
          selectedType: TransactionType.expense,
          onChanged: (_) {},
        ),
      ),
    );

    final selectedChip = tester.widget<ChoiceChip>(
      find.widgetWithText(ChoiceChip, 'expense'),
    );

    expect(selectedChip.selected, isTrue);
  });
}
