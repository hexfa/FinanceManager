import 'package:finance_manager/domain/repositories/setting_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  final SettingRepository repository;

  SettingCubit(this.repository)
    : super(
        SettingState(
          currency: repository.getCurrency(),
          isDarkTheme: repository.isDarkTheme(),
        ),
      );

  Future<void> changeCurrency(String currency) async {
    emit(state.copyWith(currency: currency));
    await repository.setCurrency(currency);
  }

  Future<void> toggleDarkTheme(bool value) async {
    emit(state.copyWith(isDarkTheme: value));
    await repository.setDarkTheme(value);
  }
}
