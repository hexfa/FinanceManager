import 'package:finance_manager/data/repositories/setting_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:finance_manager/core/utils/configuration_key.dart';
import 'package:finance_manager/data/datasource/sharepref_data_source.dart';
import 'package:finance_manager/data/service/currency_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'setting_repository_imp_test.mocks.dart';

@GenerateMocks([ShareprefDataSource, CurrencyService])
void main() {
  late MockShareprefDataSource mockDataSource;
  late SettingRepositoryImpl repository;
  setUp(() {
    mockDataSource = MockShareprefDataSource();
    repository = SettingRepositoryImpl(mockDataSource);
  });
  test('getCurrency returns USD as default if not set', () {
    when(mockDataSource.getString(ConfigurationKey.currency)).thenReturn(null);
    final result = repository.getCurrency();
    expect(result, 'USD');
  });
  test('getCurrency returns saved value if present', () {
    when(mockDataSource.getString(ConfigurationKey.currency)).thenReturn('EUR');
    final result = repository.getCurrency();
    expect(result, 'EUR');
  });
  test(
    'setCurrency stores the currency and notifies the CurrencyService',
    () async {
      const currency = 'JPY';
      when(mockDataSource.setString(ConfigurationKey.currency, currency),).thenAnswer((_) async => {});
      await repository.setCurrency(currency);
      verify(
        mockDataSource.setString(ConfigurationKey.currency, currency),
      ).called(1);
    },
  );
  test('isDarkTheme returns false by default if not set', () {
    when(mockDataSource.getBool(ConfigurationKey.darkTheme)).thenReturn(null);
    final result = repository.isDarkTheme();
    expect(result, false);
  });
  test('setDarkTheme stores the theme preference', () async {
    const isDark = true;
    when(
      mockDataSource.setBool(ConfigurationKey.darkTheme, isDark),

    ).thenAnswer((_) async => {});



    await repository.setDarkTheme(isDark);



    verify(

      mockDataSource.setBool(ConfigurationKey.darkTheme, isDark),

    ).called(1);

  });



  test('isDarkTheme returns saved value when set', () {

    when(mockDataSource.getBool(ConfigurationKey.darkTheme)).thenReturn(true);



    final result = repository.isDarkTheme();



    expect(result, true);

  });

}
