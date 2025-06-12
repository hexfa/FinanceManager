import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/category.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_state.dart';
import 'package:finance_manager/presentation/view/screens/transaction/update/update_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../helpers/mock_cubit.dart';

void main() {
  testWidgets('initializes fields with transaction data', (tester) async {
    final transaction = Transaction(
      id: 1,
      title: 'Rent',
      amount: 5000,
      category: Category(id: 2, name: 'Housing'),
      type: TransactionType.expense,
      date: DateTime(2024, 1, 1),
      description: '',
    );

    final mockCubit = MockTransactionCubit();
    when(
      () => mockCubit.state,
    ).thenReturn(TransactionState() as TransactionState Function());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TransactionCubit>.value(
          value: mockCubit,
          child: UpdateTransactionScreen(transaction: transaction),
        ),
      ),
    );

    await tester.pump();

    expect(find.widgetWithText(TextField, 'Rent'), findsOneWidget);
    expect(find.text('5000'), findsOneWidget);
  });

  testWidgets(
    'calls updateTransaction and pops when update button is pressed',
    (tester) async {
      final transaction = Transaction(
        id: 1,
        title: 'Rent',
        amount: 5000,
        category: Category(id: 2, name: 'Housing'),
        type: TransactionType.expense,
        date: DateTime(2024, 1, 1),
        description: '',
      );

      final mockCubit = MockTransactionCubit();
      when(() => mockCubit.state).thenReturn(
        TransactionState(
              title: 'Rent',
              amount: '5000',
              category: transaction.category,
              type: transaction.type,
              date: transaction.date,
            )
            as TransactionState Function(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<TransactionCubit>.value(
            value: mockCubit,
            child: UpdateTransactionScreen(transaction: transaction),
          ),
        ),
      );

      await tester.pump();

      final updateButton = find.widgetWithText(ElevatedButton, 'Update');
      expect(updateButton, findsOneWidget);

      await tester.tap(updateButton);
      await tester.pumpAndSettle();

      verify(() => mockCubit.updateTransaction(transaction.id!)).called(1);
    },
  );

  testWidgets('displays initial category name and date correctly', (
    tester,
  ) async {
    final transaction = Transaction(
      id: 1,
      title: 'Gym',
      amount: 200,
      category: Category(id: 5, name: 'Health'),
      type: TransactionType.expense,
      date: DateTime(2023, 12, 31),
      description: '',
    );

    final mockCubit = MockTransactionCubit();
    when(
      () => mockCubit.state,
    ).thenReturn(TransactionState() as TransactionState Function());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TransactionCubit>.value(
          value: mockCubit,
          child: UpdateTransactionScreen(transaction: transaction),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('Health'), findsWidgets);
    expect(find.textContaining('2023'), findsWidgets);
  });
}
