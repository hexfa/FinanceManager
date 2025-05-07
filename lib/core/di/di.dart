import 'package:finance_manager/data/repositories/transaction_repository_imp.dart';
import 'package:finance_manager/domain/repositories/transaction_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  _registerRepositories();
}

void _registerRepositories() {
  getIt.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(),
  );
}
