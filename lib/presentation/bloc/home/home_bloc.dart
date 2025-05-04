import 'package:finance_manager/core/utils/category_type.dart';
import 'package:finance_manager/core/utils/transaction_type.dart';
import 'package:finance_manager/data/models/PieData.dart';
import 'package:finance_manager/data/models/transaction.dart';
import 'package:finance_manager/presentation/bloc/base/base_bloc.dart';
import 'package:finance_manager/presentation/bloc/base/base_bloc_state.dart';
import 'package:finance_manager/presentation/bloc/base/base_event.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  List<PieData> data = [
    PieData(title: 'کار', percentage: 5, color: Colors.blue),
    PieData(title: 'تفریح', percentage: 7, color: Colors.green),
    PieData(title: 'ورزش', percentage: 20, color: Colors.orange),
    PieData(title: 'دیگر', percentage: 17, color: Colors.grey),
    PieData(title: 'مطالعه', percentage: 30, color: Colors.purple),
    PieData(title: 'خواب', percentage: 21, color: Colors.red),
  ];

  List<Transaction> transactions = [
    Transaction(
      title: 'Work',
      amount: 22.0,
      type: TransactionType.income,
      category: CategoryType.business,
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Sport',
      amount: 42.0,
      type: TransactionType.expense,
      category: CategoryType.sport,
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Education',
      amount: 50.0,
      type: TransactionType.income,
      category: CategoryType.education,
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Other',
      amount: 60.0,
      type: TransactionType.expense,
      category: CategoryType.other,
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Work',
      amount: 100.0,
      type: TransactionType.income,
      category: CategoryType.business,
      date: DateTime.now(),
    ),
  ];

  HomeBloc() : super(HomeInitial()) {
    on<InitialList>(_onInitialList);
  }

  void _onInitialList(InitialList event, emit) {
    emit(InitialData(data, transactions));
  }
}
