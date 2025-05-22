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
}
