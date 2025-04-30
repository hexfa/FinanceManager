import 'package:finance_manager/data/models/PieData.dart';
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

  HomeBloc() : super(HomeInitial()) {
    on<InitialList>(_onInitialList);
  }

  void _onInitialList(InitialList event, emit) {
    emit(InitialData(data));
  }
}
