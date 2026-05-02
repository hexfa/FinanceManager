import 'package:finance_manager/core/extension/extension.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/category.dart';
import 'package:finance_manager/data/repositories/transaction_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:finance_manager/data/datasource/db_data_source.dart';
import 'package:finance_manager/data/models/transaction.dart';
class MockDBDataSource extends Mock implements DBDataSource {}

void main() {
  late MockDBDataSource mockDataSource;
  late TransactionRepositoryImpl repository;
  final testTransaction = Transaction(
    id: 1,
    title: "Test Transaction",
    description: "Description",
    amount: 100.0,
    type: TransactionType.income,
    category: Category(id: 1, name: 'sport'),
    date: DateTime(2023, 1, 1),
  );

  final testTransactionEntity = testTransaction.toEntity();
  setUp(() {
    mockDataSource = MockDBDataSource();
    repository = TransactionRepositoryImpl(mockDataSource);
  });
  group('TransactionRepositoryImpl Tests', () {
    test('getAllTransactions returns list of transactions', () async {
      // Arrange
      when(
        mockDataSource.getAll(),
      ).thenAnswer((_) async => [testTransactionEntity]);
      // Act
      final result = await repository.getAllTransactions();
      // Assert
      expect(result, isA<List<Transaction>>());
      expect(result.length, 1);
      expect(result[0].id, testTransaction.id);
      verify(mockDataSource.getAll()).called(1);
    });
    test(
      'createTransaction calls dataSource.create with correct entity',
      () async {
        // Act
        await repository.createTransaction(transaction: testTransaction);
        // Assert
        verify(mockDataSource.create(testTransactionEntity)).called(1);
        },
    );
    test(
      'updateTransaction calls dataSource.update with correct id and entity',
      () async {
        // Act
        await repository.updateTransaction(transaction: testTransaction);
        // Assert
        verify(
          mockDataSource.update(testTransaction.id!, testTransactionEntity),
        ).called(1);
        },
    );

    test('deleteTransaction calls dataSource.delete with correct id', () async {

      // Act

      await repository.deleteTransaction(testTransaction.id!);



      // Assert

      verify(mockDataSource.delete(testTransaction.id!)).called(1);

    });



    test('getTransactionById returns transaction when found', () async {

      // Arrange

      when(

        mockDataSource.getById(testTransaction.id!),

      ).thenAnswer((_) async => testTransactionEntity);



      // Act

      final result = await repository.getTransactionById(testTransaction.id!);



      // Assert

      expect(result, isNotNull);

      expect(result!.id, testTransaction.id);

      verify(mockDataSource.getById(testTransaction.id!)).called(1);

    });

  });



  test('getTransactionById returns null when not found', () async {

    // Arrange

    when(

      mockDataSource.getById(testTransaction.id!),

    ).thenAnswer((_) async => null);



    // Act

    final result = await repository.getTransactionById(testTransaction.id!);



    // Assert

    expect(result, isNull);

    verify(mockDataSource.getById(testTransaction.id!)).called(1);

  });

}
