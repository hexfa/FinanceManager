import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/home/home_state.dart';
import 'package:finance_manager/presentation/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/mock_home_cubit.dart';

void main() {
  testWidgets('should display WalletCard with correct data', (tester) async {
    final mockState = InitialData(
      [],
      [
        Transaction(
          id: 1,
          title: 'Coffee',
          description: 'des',
          amount: 5.0,
          type: TransactionType.expense,
          category: CategoryType.education,
          date: DateTime.parse('2025-06-07T15:18:17'),
        ),
      ],
      100.0,
      50.0,
      50.0,
      1,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => MockHomeCubit()..emit(mockState),
          child: const HomeScreen(),
        ),
      ),
    );

    expect(find.text('50.0'), findsWidgets); // Balance
    expect(find.text('100.0'), findsWidgets); // Income
    expect(find.text('50.0'), findsWidgets); // Expense
  });

  testWidgets('should show expense chart label', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => MockHomeCubit()..emit(InitialData(...)),
          child: const HomeScreen(),
        ),
      ),
    );

    expect(find.text('Expense Chart'), findsOneWidget);
  });
}
