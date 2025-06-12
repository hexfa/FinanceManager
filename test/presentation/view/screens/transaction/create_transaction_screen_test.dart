import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/category.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_state.dart';
import 'package:finance_manager/presentation/view/screens/transaction/create/create_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/mock_cubit.dart';

void main() {
  testWidgets('renders app bar with title and create button', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TransactionCubit>(
          create: (_) => MockTransactionCubit(),
          child: const CreateTransactionScreen(),
        ),
      ),
    );

    expect(find.text('Add Transaction'), findsOneWidget);
    expect(find.text('Create'), findsOneWidget);
  });

  testWidgets(
    'calls createTransaction and pops when form is valid and button pressed',
    (tester) async {
      final mockCubit = MockTransactionCubit();

      when(() => mockCubit.state).thenReturn(
        TransactionState(
          title: 'Groceries',
          amount: '1200',
          category: Category(id: 1, name: 'Food'),
          type: TransactionType.expense,
          date: DateTime.now(),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<TransactionCubit>.value(
            value: mockCubit,
            child: const CreateTransactionScreen(),
          ),
        ),
      );

      await tester.pump();

      final createButton = find.widgetWithText(ElevatedButton, 'Create');
      expect(createButton, findsOneWidget);

      await tester.tap(createButton);
      await tester.pumpAndSettle();

      verify(() => mockCubit.createTransaction()).called(1);
    },
  );
}
