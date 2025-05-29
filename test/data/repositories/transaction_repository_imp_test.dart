import 'package:finance_manager/data/repositories/transaction_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:finance_manager/data/datasource/db_data_source.dart';

import 'transaction_repository_imp_test.mocks.dart';

@GenerateMocks([DBDataSource])
void main() {
  late MockDBDataSource mockDataSource;
  late TransactionRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockDBDataSource();
    repository = TransactionRepositoryImpl(mockDataSource);
  });
}
