import 'package:finance_manager/core/utils/configuration_key.dart';
import 'package:finance_manager/data/datasource/sharepref_data_source.dart';
import 'package:finance_manager/data/service/currency_service.dart';
import 'package:finance_manager/domain/repositories/setting_repository.dart';

class SettingRepositoryImpl implements SettingRepository {
  final ShareprefDataSource dataSource;

  SettingRepositoryImpl(this.dataSource);

  @override
  String getCurrency() =>
      dataSource.getString(ConfigurationKey.currency) ?? 'USD';

  @override
  Future<void> setCurrency(String currency) async {
    dataSource.setString(ConfigurationKey.currency, currency);
    CurrencyService().notifyCurrencyChanged();
  }

  @override
  bool isDarkTheme() => dataSource.getBool(ConfigurationKey.darkTheme) ?? false;

  @override
  Future<void> setDarkTheme(bool value) =>
      dataSource.setBool(ConfigurationKey.darkTheme, value);
}