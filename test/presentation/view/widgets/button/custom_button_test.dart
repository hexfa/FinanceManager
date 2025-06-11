import 'package:finance_manager/presentation/view/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('should display the correct text', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: 'Save',
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Save'), findsOneWidget);
  });
}
