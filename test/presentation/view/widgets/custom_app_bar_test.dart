import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('verify title is rendered correctly in CustomAppBar', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(title: 'Test Title'),
      ),
    ));

    expect(find.text('Test Title'), findsOneWidget);
  });
}
