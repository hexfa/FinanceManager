import 'package:finance_manager/data/repositories/transaction_repository_imp.dart';
import 'package:finance_manager/domain/repositories/transaction_repository.dart';
import 'package:finance_manager/presentation/bloc/home/home_cubit.dart';
import 'package:finance_manager/presentation/bloc/setting/setting_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/detail/transaction_detail_cubit.dart';
import 'package:finance_manager/presentation/bloc/transaction/transaction_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  _registerRepositories();
  _registerBlocs();
}

void _registerRepositories() {
  getIt.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(),
  );
}

void _registerBlocs() {
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
  getIt.registerFactory<SettingCubit>(() => SettingCubit());
}
