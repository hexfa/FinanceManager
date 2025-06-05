import 'package:finance_manager/presentation/view/screens/category/create_category_screen.dart';
import 'package:finance_manager/presentation/view/widgets/button/custom_button.dart';
import 'package:finance_manager/presentation/view/widgets/textfield/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders CustomTextField and CustomButton', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: const CreateCategoryScreen()));

    expect(find.byType(CustomTextField), findsOneWidget);
    expect(find.byType(CustomButton), findsOneWidget);
  });
}
