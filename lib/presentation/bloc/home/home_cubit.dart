import 'package:finance_manager/data/models/PieData.dart';
import 'package:finance_manager/domain/repositories/transaction_repository.dart';
import 'package:finance_manager/presentation/bloc/base/base_cubit.dart';
import 'package:finance_manager/presentation/bloc/home/home_state.dart';
import 'package:flutter/material.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final TransactionRepository repository;
  List<PieData> data = [
    PieData(title: 'کار', percentage: 5, color: Colors.blue),
    PieData(title: 'تفریح', percentage: 7, color: Colors.green),
    PieData(title: 'ورزش', percentage: 20, color: Colors.orange),
    PieData(title: 'دیگر', percentage: 17, color: Colors.grey),
    PieData(title: 'مطالعه', percentage: 30, color: Colors.purple),
    PieData(title: 'خواب', percentage: 21, color: Colors.red),
  ];

  HomeCubit(this.repository) : super(HomeInitial());

  Future<void> loadInitialData() async {
    final transactions = await repository.getAllTransactions();
    emit(InitialData(data, transactions));
  }
}
