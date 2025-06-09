import 'package:finance_manager/core/constants/currency.dart';
import 'package:finance_manager/data/models/currency.dart';
import 'package:finance_manager/presentation/bloc/setting/setting_cubit.dart';

import 'fake_setting_repository.dart';

class SettingCubitFake extends SettingCubit {
  final FakeSettingRepository fakeRepository;

  SettingCubitFake({Currency? initialCurrency, bool initialDarkTheme = false})
    : fakeRepository = FakeSettingRepository(
        initialCurrencyCode: (initialCurrency ?? currencyList[0]).code,
        initialDarkTheme: initialDarkTheme,
      ),
      super(
        FakeSettingRepository(
          initialCurrencyCode: (initialCurrency ?? currencyList[0]).code,
          initialDarkTheme: initialDarkTheme,
        ),
      );

  String? get changedCurrencyCode => fakeRepository.lastSetCurrencyCode;

  bool? get toggledDarkTheme => fakeRepository.lastSetDarkTheme;
}
