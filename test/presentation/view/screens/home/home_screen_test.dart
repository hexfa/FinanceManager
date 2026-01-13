import 'package:finance_manager/core/utils/transaction_type.dart';

import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/home/home_state.dart';
import 'package:finance_manager/presentation/navigation/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/mock_go_router.dart';

void main() {
  testWidgets('should display WalletCard with correct data', (tester) async {
    // final mockState = InitialData(
    //   [],
    //   [
    //     Transaction(
    //       id: 1,
    //       title: 'Coffee',
    //       description: 'des',
    //       amount: 5.0,
    //       type: TransactionType.expense,
    //       category: Category(id: 1, name: 'education'),
    //       date: DateTime.parse('2025-06-07T15:18:17'),
    //     ),
    //   ],
    //   100.0,
    //   50.0,
    //   50.0,
    //   1,
    // );

    // await tester.pumpWidget(
    //   MaterialApp(
    //     home: BlocProvider(
    //       create: (_) =>
    //       MockHomeCubit()
    //         ..emit(mockState),
    //       child: const HomeScreen(),
    //     ),
    //   ),
    // );

    expect(find.text('50.0'), findsWidgets); // Balance
    expect(find.text('100.0'), findsWidgets); // Income
    expect(find.text('50.0'), findsWidgets); // Expense
  });

  testWidgets('should show expense chart label', (tester) async {
    // await tester.pumpWidget(
    //   MaterialApp(
    //     home: BlocProvider(
    //       create: (_) =>
    //       MockHomeCubit()
    //         ..emit(InitialData(...)),
    //       child: const HomeScreen(),
    //     ),
    //   ),
    // );

    expect(find.text('Expense Chart'), findsOneWidget);
  });

  testWidgets('should navigate to transaction list screen', (tester) async {
    final mockRouter = MockGoRouter();

    // await tester.pumpWidget(
    //   MaterialApp.router(
    //     routerDelegate: mockRouter.routerDelegate,
    //     routeInformationParser: mockRouter.routeInformationParser,
    //   ),
    // );

    await tester.tap(find.textContaining('See All'));
    await tester.pumpAndSettle();

    verify(() => mockRouter.push(RoutePath.transactionListRoute)).called(1);
  });

  testWidgets(
      'should navigate to create transaction screen on + button press', (
      tester) async {
    final mockRouter = MockGoRouter();

    // await tester.pumpWidget(
    //   MaterialApp.router(
    //     routerDelegate: mockRouter.routerDelegate,
    //     routeInformationParser: mockRouter.routeInformationParser,
    //   ),
    // );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    verify(() => mockRouter.push(RoutePath.createTransactionRoute)).called(1);
  });

  testWidgets('should navigate to setting screen from app bar menu', (tester) async {
    final mockRouter = MockGoRouter();

    // await tester.pumpWidget(
    //   MaterialApp.router(
    //     routerDelegate: mockRouter.routerDelegate,
    //     routeInformationParser: mockRouter.routeInformationParser,
    //   ),
    // );

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    verify(() => mockRouter.push(RoutePath.settingRoute)).called(1);
  });
}
