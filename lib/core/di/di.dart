import 'package:finance_manager/data/datasource/db_data_source.dart';
import 'package:finance_manager/data/datasource/sharepref_data_source.dart';
import 'package:finance_manager/data/repositories/setting_repository_imp.dart';
import 'package:finance_manager/data/repositories/transaction_repository_imp.dart';
import 'package:finance_manager/domain/entities/transaction_entity.dart';
import 'package:finance_manager/domain/repositories/setting_repository.dart';
import 'package:finance_manager/domain/repositories/transaction_repository.dart';
import 'package:finance_manager/presentation/bloc/home/home_cubit.dart';
import 'package:finance_manager/presentation/bloc/setting/setting_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/detail/transaction_detail_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await _registerDataSource();
  _registerRepositories();
  _registerBlocs();
}

Future<void> _registerDataSource() async {
  getIt.registerSingleton<ShareprefDataSource>(
    ShareprefDataSource(await SharedPreferences.getInstance()),
  );
  getIt.registerSingleton<DBDataSource>(
    DBDataSource(await Hive.openBox<TransactionEntity>('transactions')),
  );
}

void _registerRepositories() {
  getIt.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(getIt<DBDataSource>()),
  );
  getIt.registerSingleton<SettingRepository>(
    SettingRepositoryImpl(getIt<ShareprefDataSource>()),
  );
}

Future<void> _registerBlocs() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(transactionRepository: getIt<TransactionRepository>()),
  );
  getIt.registerFactory<TransactionCubit>(
    () =>
        TransactionCubit(transactionRepository: getIt<TransactionRepository>()),
  );
  getIt.registerFactory<TransactionDetailCubit>(
    () => TransactionDetailCubit(
      transactionRepository: getIt<TransactionRepository>(),
    ),
  );
  getIt.registerFactory<SettingCubit>(
    () => SettingCubit(getIt<SettingRepository>()),
  );
}
