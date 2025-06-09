import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/build_testable_widget.dart';

void main() {
  testWidgets('verify more_vert icon is displayed in CustomAppBarMenu', (
    tester,
  ) async {
    await tester.pumpWidget(
      buildTestableWidget(CustomAppBarMenu(menuItem: [])),
    );

    expect(find.byIcon(Icons.more_vert), findsOneWidget);
  });
}
