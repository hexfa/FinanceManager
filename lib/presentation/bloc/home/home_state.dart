part of 'home_bloc.dart';

abstract class HomeState extends BaseBlocState {}

final class HomeInitial extends HomeState {}

final class InitialData extends HomeState {
  final List<PieData> dataList;
  final List<Transaction> transactionList;

  InitialData(this.dataList, this.transactionList);

  @override
  List<Object?> get props => [dataList, transactionList];
}
