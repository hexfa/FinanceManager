import 'package:finance_manager/core/constants/currency.dart';
import 'package:finance_manager/data/models/currency.dart';
import 'package:finance_manager/presentation/view/screens/setting/setting_screen.dart';
import 'package:finance_manager/presentation/view/widgets/dropdown/custom_drop_down.dart';
import 'package:finance_manager/presentation/view/widgets/switch/custom_switch.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/build_testable_widget.dart';
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
}
