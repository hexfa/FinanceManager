import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('verify title is rendered correctly in CustomAppBar', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(appBar: CustomAppBar(title: 'Test Title'))),
    );

    expect(find.text('Test Title'), findsOneWidget);
  });

  testWidgets('ensure leading widget appears when provided in CustomAppBar', (
    tester,
  ) async {
    const leadingIcon = Icon(Icons.menu);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(title: 'Test', leading: leadingIcon),
        ),
      ),
    );

    expect(find.byIcon(Icons.menu), findsOneWidget);
  });
}
