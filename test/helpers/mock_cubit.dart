// test/mocks.dart
import 'package:finance_manager/presentation/bloc/category/category_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_state.dart';
import 'package:finance_manager/presentation/bloc/category/category_state.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionCubit extends Mock implements TransactionCubit {}

class MockCategoryCubit extends Mock implements CategoryCubit {}

class FakeTransactionState extends Fake implements TransactionState {}

class FakeCategoryState extends Fake implements CategoryState {}
