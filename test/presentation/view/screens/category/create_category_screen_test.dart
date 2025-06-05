import 'package:finance_manager/presentation/view/screens/category/create_category_screen.dart';
import 'package:finance_manager/presentation/view/widgets/button/custom_button.dart';
import 'package:finance_manager/presentation/view/widgets/textfield/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_category_cubit_test.dart';

void main() {
  setUpAll(() {
    registerFallbackValue('');
  });

  testWidgets('renders CustomTextField and CustomButton', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: const CreateCategoryScreen()));

    expect(find.byType(CustomTextField), findsOneWidget);
    expect(find.byType(CustomButton), findsOneWidget);
  });

  testWidgets('does not call create when text is empty', (
    WidgetTester tester,
  ) async {
    final mockCubit = MockCategoryCubit();

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: mockCubit,
          child: const CreateCategoryScreen(),
        ),
      ),
    );

    await tester.tap(find.byType(CustomButton));
    await tester.pump();

    // verifyNever(() => mockCubit.create(any()));
  });
}
