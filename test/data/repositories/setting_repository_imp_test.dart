import 'package:finance_manager/data/repositories/setting_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:finance_manager/data/datasource/sharepref_data_source.dart';
import 'package:finance_manager/data/service/currency_service.dart';
import 'package:mockito/annotations.dart';

import 'setting_repository_imp_test.mocks.dart';

@GenerateMocks([ShareprefDataSource, CurrencyService])
void main() {
  late MockShareprefDataSource mockDataSource;
  late SettingRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockShareprefDataSource();
    repository = SettingRepositoryImpl(mockDataSource);
  });
}
