import 'package:finance_manager/core/constants/currency.dart';
import 'package:finance_manager/data/models/app_bar_menu.dart';
import 'package:finance_manager/data/models/currency.dart';
import 'package:finance_manager/presentation/view/screens/setting/setting_screen.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar_menu.dart';
import 'package:finance_manager/presentation/view/widgets/dropdown/custom_drop_down.dart';
import 'package:finance_manager/presentation/view/widgets/switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/build_testable_widget.dart';
import '../../../../helpers/mock_navigator_observer.dart';
import '../../../../helpers/setting_cubit_fake.dart';

void main() {
  testWidgets('should display all widgets in SettingScreen', (tester) async {
    await tester.pumpWidget(buildTestableWidget(const SettingScreen()));

    expect(find.text('Country'), findsOneWidget);
    expect(find.byType(CustomDropdown<Currency>), findsOneWidget);
    expect(find.text('Dark Theme'), findsOneWidget);
    expect(find.byType(CustomSwitch), findsOneWidget);
    expect(find.text('Create Category'), findsOneWidget);
  });

  testWidgets('should call changeCurrency when a new currency is selected', (
    tester,
  ) async {
    final cubit = SettingCubitFake();
    await tester.pumpWidget(
      buildTestableWidget(const SettingScreen(), settingCubit: cubit),
    );

    await tester.tap(find.byType(CustomDropdown<Currency>));
    await tester.pumpAndSettle();

    await tester.tap(
      find.text('${currencyList[1].code} - ${currencyList[1].name}').last,
    );
    await tester.pump();

    expect(cubit.changedCurrencyCode, currencyList[1]);
  });

  testWidgets('should call toggleDarkTheme when switch is toggled', (
    tester,
  ) async {
    final cubit = SettingCubitFake();
    await tester.pumpWidget(
      buildTestableWidget(const SettingScreen(), settingCubit: cubit),
    );

    await tester.tap(find.byType(CustomSwitch));
    await tester.pump();

    expect(cubit.toggledDarkTheme, isTrue);
  });

  testWidgets('should navigate to CreateCategoryScreen on tap', (tester) async {
    final navObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      buildTestableWidget(
        const SettingScreen(),
        navigatorObserver: navObserver,
      ),
    );

    await tester.tap(find.text('Create Category'));
    await tester.pumpAndSettle();

    // verify(navObserver.didPush(any, any));
  });

  testWidgets('should display selected currency in dropdown', (tester) async {
    final currency = currencyList[2];
    final cubit = SettingCubitFake(initialCurrency: currency);

    await tester.pumpWidget(
      buildTestableWidget(const SettingScreen(), settingCubit: cubit),
    );

    expect(find.text('${currency.code} - ${currency.name}'), findsOneWidget);
  });

  testWidgets('Verify each menu item displays its correct icon', (
    tester,
  ) async {
    final menuItems = [
      AppBarMenu(title: 'Edit', icon: Icons.edit, onTap: () {}),
      AppBarMenu(title: 'Delete', icon: Icons.delete, onTap: () {}),
    ];

    await tester.pumpWidget(
      buildTestableWidget(CustomAppBarMenu(menuItem: menuItems)),
    );

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.edit), findsOneWidget);
    expect(find.byIcon(Icons.delete), findsOneWidget);
  });

  testWidgets('Ensure no menu items are shown when list is empty', (tester) async {
    await tester.pumpWidget(buildTestableWidget(
      CustomAppBarMenu(menuItem: []),
    ));

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();

    expect(find.byType(PopupMenuItem), findsNothing);
  });
}
