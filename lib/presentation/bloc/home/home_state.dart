part of 'home_bloc.dart';

abstract class HomeState extends BaseBlocState {}

final class HomeInitial extends HomeState {}

final class InitialData extends HomeState {
  final List<PieData> dataList;

  InitialData(this.dataList);

  @override
  List<Object?> get props => [dataList];
}
