import 'package:finance_manager/presentation/view/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('should display the correct text', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: CustomButton(text: 'Save', onPressed: () {})),
      ),
    );
    expect(find.text('Save'), findsOneWidget);
  });
  testWidgets('should call onPressed when tapped', (tester) async {
    var wasPressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: 'Click me',
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      ),
    );
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(wasPressed, isTrue);
  });
  testWidgets('should be disabled when onPressed is null', (tester) async {
    await tester.pumpWidget(
      MaterialApp(

        home: Scaffold(body: CustomButton(text: 'Disabled', onPressed: null)),

      ),

    );



    final ElevatedButton button = tester.widget(find.byType(ElevatedButton));

    expect(button.onPressed, isNull);

  });



  testWidgets('should have correct style', (tester) async {

    await tester.pumpWidget(

      MaterialApp(

        home: Scaffold(body: CustomButton(text: 'Styled', onPressed: () {})),

      ),

    );



    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));

    final shape = button.style?.shape?.resolve({}) as RoundedRectangleBorder;



    expect(shape.borderRadius, BorderRadius.circular(8));

  });

}
