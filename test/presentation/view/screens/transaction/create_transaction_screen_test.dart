import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/view/screens/transaction/create/create_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
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
}
