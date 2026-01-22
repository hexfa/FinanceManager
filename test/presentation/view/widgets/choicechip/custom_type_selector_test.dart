
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



  testWidgets('calls onChanged when a chip is tapped', (tester) async {

    TransactionType? selected;



    await tester.pumpWidget(

      MaterialApp(

        home: CustomTypeSelector(

          selectedType: null,

          onChanged: (value) => selected = value,

        ),

      ),

    );



    await tester.tap(find.text('income'));

    expect(selected, TransactionType.income);



    await tester.tap(find.text('expense'));

    expect(selected, TransactionType.expense);

  });


  testWidgets('displays correct icons for income and expense', (tester) async {

    await tester.pumpWidget(

      MaterialApp(

        home: CustomTypeSelector(

          selectedType: TransactionType.expense,

          onChanged: (_) {},

        ),

      ),

    );



    final incomeIcon = find.byIcon(Icons.arrow_downward);

    final expenseIcon = find.byIcon(Icons.arrow_upward);



    expect(incomeIcon, findsOneWidget);

    expect(expenseIcon, findsOneWidget);

  });



  testWidgets('sets avatar color based on transaction type', (tester) async {

    await tester.pumpWidget(

      MaterialApp(

        home: Builder(

          builder:

              (context) =>

                  CustomTypeSelector(selectedType: null, onChanged: (_) {}),

        ),

      ),

    );



    final incomeIcon = tester.widget<Icon>(find.byIcon(Icons.arrow_downward));

    final expenseIcon = tester.widget<Icon>(find.byIcon(Icons.arrow_upward));



    expect(incomeIcon.color, ThemeData().colorScheme.surfaceDim);

    expect(expenseIcon.color, ThemeData().colorScheme.error);

  });

}
