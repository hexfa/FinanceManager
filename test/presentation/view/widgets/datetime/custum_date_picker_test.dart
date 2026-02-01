import 'package:finance_manager/presentation/view/widgets/datetime/custom_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  testWidgets('displays current datetime if no initial value is provided', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: DateTimePickerContainer(onDateTimeSelected: (_) {})),
    );
    final now = DateTime.now();
    expect(find.textContaining('${now.year}'), findsOneWidget);
  });
  testWidgets('displays initial datetime if provided', (tester) async {
    final initial = DateTime(2023, 1, 1, 10, 30);
    await tester.pumpWidget(
      MaterialApp(
        home: DateTimePickerContainer(
          initialDateTime: initial,
          onDateTimeSelected: (_) {},
        ),

      ),

    );



    expect(find.text('2023/01/01 – 10:30'), findsOneWidget);

  });




  testWidgets('contains calendar and dropdown icons', (tester) async {

    await tester.pumpWidget(

      MaterialApp(home: DateTimePickerContainer(onDateTimeSelected: (_) {})),

    );



    expect(find.byIcon(Icons.calendar_today), findsOneWidget);

    expect(find.byIcon(Icons.arrow_drop_down), findsOneWidget);

  });




  testWidgets('uses theme text style for datetime text', (tester) async {

    await tester.pumpWidget(

      MaterialApp(home: DateTimePickerContainer(onDateTimeSelected: (_) {})),

    );



    final textWidget = tester.widget<Text>(find.byType(Text).first);

    expect(textWidget.style, isNotNull);

  });



  testWidgets('renders layout with Row and Expanded text', (tester) async {

    await tester.pumpWidget(

      MaterialApp(home: DateTimePickerContainer(onDateTimeSelected: (_) {})),

    );



    expect(find.byType(Row), findsOneWidget);

    expect(find.byType(Expanded), findsOneWidget);

  });


}
